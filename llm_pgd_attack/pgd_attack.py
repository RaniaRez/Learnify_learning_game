import torch
import torch.nn.functional as F
import numpy as np
from tqdm import tqdm
from transformers import AutoModelForCausalLM, AutoTokenizer

class PGDAttack:
    def __init__(self, model, tokenizer, device=None):
        """
        Initialize the PGD attack for LLMs.
        
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
        
    def _get_embedding_matrix(self):
        """Get the embedding matrix from the model."""
        # This assumes the model has a get_input_embeddings method (most HF models do)
        return self.model.get_input_embeddings().weight
    
    def _compute_loss(self, input_ids, target_ids, attention_mask=None):
        """
        Compute the loss for the attack.
        
        Args:
            input_ids: Input token IDs
            target_ids: Target token IDs
            attention_mask: Attention mask for the input
            
        Returns:
            Loss value
        """
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
    
    def _project_to_embedding_space(self, embeddings, epsilon):
        """
        Project the embeddings to the epsilon-ball around the original embeddings.
        
        Args:
            embeddings: The current embeddings
            epsilon: The radius of the projection ball
            
        Returns:
            Projected embeddings
        """
        # Get the embedding matrix
        embedding_matrix = self._get_embedding_matrix()
        
        # For each position, find the closest token embedding
        batch_size, seq_len, emb_dim = embeddings.shape
        
        # Reshape for efficient computation
        flat_embeddings = embeddings.view(-1, emb_dim)
        
        # Calculate distances to all token embeddings
        distances = torch.cdist(flat_embeddings, embedding_matrix)
        
        # Find the closest token embedding for each position
        closest_token_indices = torch.argmin(distances, dim=1)
        
        # Get the embeddings for the closest tokens
        projected_embeddings = embedding_matrix[closest_token_indices].view(batch_size, seq_len, emb_dim)
        
        return projected_embeddings
    
    def _continuous_to_discrete(self, embeddings):
        """
        Convert continuous embeddings to discrete token IDs.
        
        Args:
            embeddings: Continuous embeddings
            
        Returns:
            Token IDs corresponding to the closest embeddings
        """
        # Get the embedding matrix
        embedding_matrix = self._get_embedding_matrix()
        
        # For each position, find the closest token embedding
        batch_size, seq_len, emb_dim = embeddings.shape
        
        # Reshape for efficient computation
        flat_embeddings = embeddings.view(-1, emb_dim)
        
        # Calculate distances to all token embeddings
        distances = torch.cdist(flat_embeddings, embedding_matrix)
        
        # Find the closest token embedding for each position
        closest_token_indices = torch.argmin(distances, dim=1)
        
        # Reshape back to batch_size x seq_len
        token_ids = closest_token_indices.view(batch_size, seq_len)
        
        return token_ids
    
    def generate_adversarial_prompt(self, target_prompt, forbidden_response, 
                                   num_iterations=100, step_size=0.1, epsilon=1.0,
                                   max_length=64, num_candidates=5, verbose=True):
        """
        Generate an adversarial prompt using PGD.
        
        Args:
            target_prompt: The original prompt to be modified
            forbidden_response: The response we want to elicit (that the model should refuse)
            num_iterations: Number of PGD iterations
            step_size: Step size for gradient updates
            epsilon: Maximum perturbation size
            max_length: Maximum length of the prompt
            num_candidates: Number of candidate prompts to try at each step
            verbose: Whether to show progress bar
            
        Returns:
            Adversarial prompt as a string
        """
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
            # We use the negative log-likelihood of the forbidden tokens
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
                    candidate_embeddings = self._project_to_embedding_space(candidate_embeddings, epsilon)
                    
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
        
        # Convert token IDs back to text
        adversarial_prompt = self.tokenizer.decode(best_token_ids[0], skip_special_tokens=True)
        
        return adversarial_prompt
    
    def test_prompt(self, prompt, max_new_tokens=100):
        """
        Test a prompt by generating a response from the model.
        
        Args:
            prompt: The prompt to test
            max_new_tokens: Maximum number of new tokens to generate
            
        Returns:
            Generated response
        """
        inputs = self.tokenizer(prompt, return_tensors="pt").to(self.device)
        
        # Generate response
        with torch.no_grad():
            output_ids = self.model.generate(
                inputs["input_ids"],
                attention_mask=inputs["attention_mask"],
                max_new_tokens=max_new_tokens,
                do_sample=True,
                temperature=0.7,
                top_p=0.9,
                pad_token_id=self.pad_token_id
            )
        
        # Decode the response (excluding the prompt)
        prompt_length = inputs["input_ids"].shape[1]
        response_ids = output_ids[0][prompt_length:]
        response = self.tokenizer.decode(response_ids, skip_special_tokens=True)
        
        return response

