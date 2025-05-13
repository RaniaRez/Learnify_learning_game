import torch
import torch.nn.functional as F
import numpy as np
from tqdm import tqdm
from transformers import AutoModelForCausalLM, AutoTokenizer

class AdvancedPGDAttack:
    def __init__(self, model, tokenizer, device=None):
        """
        Initialize the advanced PGD attack for LLMs with additional features.
        
        Args:
            model: The target language model (HuggingFace model)
            tokenizer: The tokenizer for the model
            device: The device to run the attack on (default: cuda if available, else cpu)
        """
        self.model = model
        self.tokenizer = tokenizer
        self.device = device if device else ('cuda' if torch.cuda.is_available() else 'cpu')
        self.model.to(self.device)
        self.model.eval()  # Set model to evaluation mode
        
        # Special token handling
        self.pad_token_id = tokenizer.pad_token_id if tokenizer.pad_token_id is not None else tokenizer.eos_token_id
        
        # Track metrics during attack
        self.loss_history = []
        self.similarity_history = []
        self.embedding_history = []
        self.token_importance = None
    
    def _get_embedding_matrix(self):
        """Get the embedding matrix from the model."""
        return self.model.get_input_embeddings().weight
    
    def _compute_loss(self, input_ids, target_ids, attention_mask=None):
        """Compute the loss for the attack."""
        outputs = self.model(input_ids=input_ids, attention_mask=attention_mask)
        logits = outputs.logits
        
        # Shift logits and target_ids for next token prediction
        shift_logits = logits[..., :-1, :].contiguous()
        shift_labels = target_ids[..., 1:].contiguous()
        
        # Calculate cross-entropy loss
        loss = F.cross_entropy(
            shift_logits.view(-1, shift_logits.size(-1)),
            shift_labels.view(-1),
            ignore_index=-100,
            reduction='mean'
        )
        
        return loss
    
    def _compute_kl_divergence(self, input_ids, original_input_ids, attention_mask=None):
        """Compute KL divergence between original and perturbed outputs."""
        with torch.no_grad():
            original_outputs = self.model(input_ids=original_input_ids, attention_mask=attention_mask)
            original_logits = original_outputs.logits
            original_probs = F.softmax(original_logits, dim=-1)
        
        outputs = self.model(input_ids=input_ids, attention_mask=attention_mask)
        logits = outputs.logits
        log_probs = F.log_softmax(logits, dim=-1)
        
        kl_div = F.kl_div(log_probs.view(-1, log_probs.size(-1)), 
                          original_probs.view(-1, original_probs.size(-1)), 
                          reduction='batchmean')
        
        return kl_div
    
    def _project_to_embedding_space(self, embeddings, epsilon, original_embeddings=None):
        """
        Project the embeddings to the epsilon-ball around the original embeddings.
        
        Args:
            embeddings: The current embeddings
            epsilon: The radius of the projection ball
            original_embeddings: The original embeddings (if None, use embedding matrix)
            
        Returns:
            Projected embeddings
        """
        if original_embeddings is not None:
            # Project to epsilon-ball around original embeddings
            delta = embeddings - original_embeddings
            norm = torch.norm(delta, dim=-1, keepdim=True)
            factor = torch.min(torch.ones_like(norm), epsilon / (norm + 1e-10))
            return original_embeddings + delta * factor
        else:
            # Project to the embedding matrix (discrete tokens)
            embedding_matrix = self._get_embedding_matrix()
            batch_size, seq_len, emb_dim = embeddings.shape
            flat_embeddings = embeddings.view(-1, emb_dim)
            distances = torch.cdist(flat_embeddings, embedding_matrix)
            closest_token_indices = torch.argmin(distances, dim=1)
            projected_embeddings = embedding_matrix[closest_token_indices].view(batch_size, seq_len, emb_dim)
            return projected_embeddings
    
    def _continuous_to_discrete(self, embeddings):
        """Convert continuous embeddings to discrete token IDs."""
        embedding_matrix = self._get_embedding_matrix()
        batch_size, seq_len, emb_dim = embeddings.shape
        flat_embeddings = embeddings.view(-1, emb_dim)
        distances = torch.cdist(flat_embeddings, embedding_matrix)
        closest_token_indices = torch.argmin(distances, dim=1)
        token_ids = closest_token_indices.view(batch_size, seq_len)
        return token_ids
    
    def _compute_token_importance(self, embeddings, target_ids, attention_mask=None):
        """
        Compute the importance of each token for the attack.
        
        Args:
            embeddings: The current embeddings
            target_ids: Target token IDs
            attention_mask: Attention mask
            
        Returns:
            Array of importance scores for each token
        """
        embeddings.requires_grad_(True)
        
        # Forward pass
        outputs = self.model(inputs_embeds=embeddings, attention_mask=attention_mask)
        logits = outputs.logits
        
        # Calculate loss
        shift_logits = logits[..., :-1, :].contiguous()
        shift_labels = target_ids[..., 1:].contiguous()
        loss = F.cross_entropy(
            shift_logits.view(-1, shift_logits.size(-1)),
            shift_labels.view(-1),
            ignore_index=-100,
            reduction='mean'
        )
        
        # Backward pass
        loss.backward()
        
        # Calculate importance as gradient magnitude
        importance = torch.norm(embeddings.grad, dim=-1).detach().cpu().numpy()[0]
        
        # Reset gradients
        embeddings.grad.zero_()
        
        return importance
    
    def generate_adversarial_prompt(self, target_prompt, forbidden_response, 
                                   num_iterations=100, step_size=0.1, epsilon=1.0,
                                   max_length=64, num_candidates=5, 
                                   kl_weight=0.0, track_metrics=True, verbose=True):
        """
        Generate an adversarial prompt using advanced PGD.
        
        Args:
            target_prompt: The original prompt to be modified
            forbidden_response: The response we want to elicit (that the model should refuse)
            num_iterations: Number of PGD iterations
            step_size: Step size for gradient updates
            epsilon: Maximum perturbation size
            max_length: Maximum length of the prompt
            num_candidates: Number of candidate prompts to try at each step
            kl_weight: Weight for KL divergence regularization (0.0 to disable)
            track_metrics: Whether to track metrics during the attack
            verbose: Whether to show progress bar
            
        Returns:
            Adversarial prompt as a string
        """
        # Reset tracking metrics
        self.loss_history = []
        self.similarity_history = []
        self.embedding_history = []
        
        # Tokenize the target prompt
        target_inputs = self.tokenizer(target_prompt, return_tensors="pt", padding=True, truncation=True, max_length=max_length)
        target_input_ids = target_inputs["input_ids"].to(self.device)
        target_attention_mask = target_inputs["attention_mask"].to(self.device)
        
        # Tokenize the forbidden response (what we want the model to generate)
        forbidden_inputs = self.tokenizer(forbidden_response, return_tensors="pt", padding=True, truncation=True, max_length=max_length)
        forbidden_input_ids = forbidden_inputs["input_ids"].to(self.device)
        
        # Get the original embeddings
        with torch.no_grad():
            original_embeddings = self.model.get_input_embeddings()(target_input_ids)
        
        # Initialize the adversarial embeddings
        adv_embeddings = original_embeddings.clone().detach().requires_grad_(True)
        
        # PGD attack loop
        iterator = tqdm(range(num_iterations)) if verbose else range(num_iterations)
        best_loss = float('inf')
        best_embeddings = None
        
        for i in iterator:
            # Forward pass with the current adversarial embeddings
            outputs = self.model(inputs_embeds=adv_embeddings, attention_mask=target_attention_mask)
            logits = outputs.logits
            
            # Calculate loss to maximize the probability of generating the forbidden response
            shift_logits = logits[..., :-1, :].contiguous()
            shift_labels = forbidden_input_ids[..., 1:].contiguous()
            
            # Create a mask for valid positions (not padding)
            valid_positions = (shift_labels != self.pad_token_id).float()
            
            # Calculate token-level probabilities
            log_probs = F.log_softmax(shift_logits, dim=-1)
            token_log_probs = torch.gather(
                log_probs, 
                dim=-1, 
                index=shift_labels.unsqueeze(-1)
            ).squeeze(-1)
            
            # Mask out padding positions
            masked_log_probs = token_log_probs * valid_positions
            
            # Calculate the negative log-likelihood (we want to minimize this)
            loss = -masked_log_probs.sum() / valid_positions.sum()
            
            # Add KL divergence regularization if enabled
            if kl_weight > 0:
                # Convert embeddings to token IDs
                adv_token_ids = self._continuous_to_discrete(adv_embeddings)
                
                # Calculate KL divergence
                kl_div = self._compute_kl_divergence(adv_token_ids, target_input_ids, target_attention_mask)
                
                # Add to loss
                loss = loss + kl_weight * kl_div
            
            # Track metrics
            if track_metrics:
                self.loss_history.append(loss.item())
                
                # Calculate similarity between original and adversarial embeddings
                with torch.no_grad():
                    similarity = F.cosine_similarity(
                        original_embeddings.view(1, -1),
                        adv_embeddings.view(1, -1)
                    ).item()
                    self.similarity_history.append(similarity)
                
                # Save embedding for visualization
                self.embedding_history.append(adv_embeddings.detach().clone().mean(dim=1))
            
            # Backward pass
            loss.backward()
            
            # Update the adversarial embeddings with gradient ascent (since we're maximizing)
            with torch.no_grad():
                # Generate multiple candidates with different random perturbations
                candidates = []
                candidate_losses = []
                
                for j in range(num_candidates):
                    # Add random noise to the gradient for exploration
                    noise = torch.randn_like(adv_embeddings.grad) * step_size * 0.1
                    
                    # Update embeddings with gradient and noise
                    candidate_embeddings = adv_embeddings - step_size * adv_embeddings.grad + noise
                    
                    # Project back to the embedding space
                    if j % 2 == 0:  # Alternate between continuous and discrete projection
                        candidate_embeddings = self._project_to_embedding_space(
                            candidate_embeddings, epsilon, original_embeddings
                        )
                    else:
                        candidate_embeddings = self._project_to_embedding_space(
                            candidate_embeddings, epsilon
                        )
                    
                    # Evaluate the candidate
                    candidate_token_ids = self._continuous_to_discrete(candidate_embeddings)
                    candidate_loss = self._compute_loss(
                        candidate_token_ids, 
                        forbidden_input_ids,
                        target_attention_mask
                    )
                    
                    candidates.append(candidate_embeddings)
                    candidate_losses.append(candidate_loss.item())
                
                # Select the best candidate
                best_candidate_idx = np.argmin(candidate_losses)
                adv_embeddings = candidates[best_candidate_idx].detach().requires_grad_(True)
                
                # Update the best embeddings if we found a better one
                if candidate_losses[best_candidate_idx] < best_loss:
                    best_loss = candidate_losses[best_candidate_idx]
                    best_embeddings = candidates[best_candidate_idx].detach().clone()
                
                # Update progress bar
                if verbose:
                    iterator.set_description(f"Loss: {best_loss:.4f}")
            
            # Zero gradients for the next iteration
            if adv_embeddings.grad is not None:
                adv_embeddings.grad.zero_()
        
        # Convert the best embeddings to token IDs
        if best_embeddings is None:
            best_embeddings = adv_embeddings.detach()
            
        best_token_ids = self._continuous_to_discrete(best_embeddings)
        
        # Compute token importance
        self.token_importance = self._compute_token_importance(
            best_embeddings, 
            forbidden_input_ids,
            target_attention_mask
        )
        
        # Convert token IDs back to text
        adversarial_prompt = self.tokenizer.decode(best_token_ids[0], skip_special_tokens=True)
        
        return adversarial_prompt
    
    def test_prompt(self, prompt, max_new_tokens=100, temperature=0.7, top_p=0.9):
        """Test a prompt by generating a response from the model."""
        inputs = self.tokenizer(prompt, return_tensors="pt").to(self.device)
        
        # Generate response
        with torch.no_grad():
            output_ids = self.model.generate(
                inputs["input_ids"],
                attention_mask=inputs["attention_mask"],
                max_new_tokens=max_new_tokens,
                do_sample=True,
                temperature=temperature,
                top_p=top_p,
                pad_token_id=self.pad_token_id
            )
        
        # Decode the response (excluding the prompt)
        prompt_length = inputs["input_ids"].shape[1]
        response_ids = output_ids[0][prompt_length:]
        response = self.tokenizer.decode(response_ids, skip_special_tokens=True)
        
        return response
    
    def get_token_importance(self):
        """Get the importance of each token in the attack."""
        if self.token_importance is None:
            raise ValueError("Token importance not computed. Run generate_adversarial_prompt first.")
        
        return self.token_importance
    
    def get_metrics_history(self):
        """Get the history of metrics tracked during the attack."""
        return {
            "loss": self.loss_history,
            "similarity": self.similarity_history,
            "embeddings": self.embedding_history
        }

