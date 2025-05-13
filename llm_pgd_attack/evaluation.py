import torch
import numpy as np
import pandas as pd
from tqdm import tqdm
from transformers import pipeline
from sklearn.metrics import accuracy_score, precision_recall_fscore_support

class AttackEvaluator:
    def __init__(self, model, tokenizer, device=None):
        """
        Initialize the attack evaluator.
        
        Args:
            model: The target language model
            tokenizer: The tokenizer for the model
            device: The device to run evaluation on
        """
        self.model = model
        self.tokenizer = tokenizer
        self.device = device if device else ('cuda' if torch.cuda.is_available() else 'cpu')
        self.model.to(self.device)
        self.model.eval()
    
    def evaluate_single_prompt(self, prompt, target_response, max_new_tokens=100, 
                              num_samples=10, temperature=0.7):
        """
        Evaluate a single prompt's effectiveness.
        
        Args:
            prompt: The prompt to evaluate
            target_response: The target response we want to elicit
            max_new_tokens: Maximum number of new tokens to generate
            num_samples: Number of samples to generate
            temperature: Temperature for generation
            
        Returns:
            Dictionary with evaluation metrics
        """
        # Tokenize the prompt
        inputs = self.tokenizer(prompt, return_tensors="pt").to(self.device)
        
        # Generate multiple responses
        generated_responses = []
        success_count = 0
        
        for _ in range(num_samples):
            with torch.no_grad():
                output_ids = self.model.generate(
                    inputs["input_ids"],
                    attention_mask=inputs["attention_mask"],
                    max_new_tokens=max_new_tokens,
                    do_sample=True,
                    temperature=temperature,
                    top_p=0.9,
                    pad_token_id=self.tokenizer.pad_token_id if self.tokenizer.pad_token_id else self.tokenizer.eos_token_id
                )
            
            # Decode the response (excluding the prompt)
            prompt_length = inputs["input_ids"].shape[1]
            response_ids = output_ids[0][prompt_length:]
            response = self.tokenizer.decode(response_ids, skip_special_tokens=True)
            
            generated_responses.append(response)
            
            # Check if the response contains the target content
            if target_response.lower() in response.lower():
                success_count += 1
        
        success_rate = success_count / num_samples
        
        # Calculate average response length
        avg_length = sum(len(response.split()) for response in generated_responses) / num_samples
        
        return {
            "success_rate": success_rate,
            "avg_response_length": avg_length,
            "responses": generated_responses
        }
    
    def evaluate_multiple_prompts(self, prompts, target_responses, max_new_tokens=100, 
                                 num_samples=5, temperature=0.7, verbose=True):
        """
        Evaluate multiple prompts.
        
        Args:
            prompts: List of prompts to evaluate
            target_responses: List of target responses
            max_new_tokens: Maximum number of new tokens to generate
            num_samples: Number of samples per prompt
            temperature: Temperature for generation
            verbose: Whether to show progress bar
            
        Returns:
            DataFrame with evaluation results
        """
        assert len(prompts) == len(target_responses), "Number of prompts and target responses must match"
        
        results = []
        iterator = tqdm(range(len(prompts))) if verbose else range(len(prompts))
        
        for i in iterator:
            prompt = prompts[i]
            target = target_responses[i]
            
            eval_result = self.evaluate_single_prompt(
                prompt, 
                target, 
                max_new_tokens=max_new_tokens,
                num_samples=num_samples,
                temperature=temperature
            )
            
            results.append({
                "prompt": prompt,
                "target_response": target,
                "success_rate": eval_result["success_rate"],
                "avg_response_length": eval_result["avg_response_length"],
                "sample_response": eval_result["responses"][0] if eval_result["responses"] else ""
            })
        
        return pd.DataFrame(results)
    
    def evaluate_with_content_moderation(self, prompts, content_model="facebook/roberta-hate-speech-dynabench-r4"):
        """
        Evaluate prompts with a content moderation model.
        
        Args:
            prompts: List of prompts to evaluate
            content_model: Content moderation model to use
            
        Returns:
            DataFrame with moderation results
        """
        # Initialize content moderation pipeline
        classifier = pipeline("text-classification", model=content_model, device=0 if torch.cuda.is_available() else -1)
        
        results = []
        
        for prompt in tqdm(prompts):
            # Get moderation result
            moderation_result = classifier(prompt)
            
            # Generate a response with the model
            inputs = self.tokenizer(prompt, return_tensors="pt").to(self.device)
            with torch.no_grad():
                output_ids = self.model.generate(
                    inputs["input_ids"],
                    attention_mask=inputs["attention_mask"],
                    max_new_tokens=100,
                    do_sample=True,
                    temperature=0.7,
                    top_p=0.9,
                    pad_token_id=self.tokenizer.pad_token_id if self.tokenizer.pad_token_id else self.tokenizer.eos_token_id
                )
            
            # Decode the response (excluding the prompt)
            prompt_length = inputs["input_ids"].shape[1]
            response_ids = output_ids[0][prompt_length:]
            response = self.tokenizer.decode(response_ids, skip_special_tokens=True)
            
            # Get moderation result for the response
            response_moderation = classifier(response)
            
            results.append({
                "prompt": prompt,
                "prompt_label": moderation_result[0]["label"],
                "prompt_score": moderation_result[0]["score"],
                "response": response,
                "response_label": response_moderation[0]["label"],
                "response_score": response_moderation[0]["score"]
            })
        
        return pd.DataFrame(results)
    
    def compare_attack_methods(self, original_prompts, attack_methods, target_responses, 
                              max_new_tokens=100, num_samples=5, verbose=True):
        """
        Compare different attack methods.
        
        Args:
            original_prompts: List of original prompts
            attack_methods: Dictionary mapping method names to functions that generate adversarial prompts
            target_responses: List of target responses
            max_new_tokens: Maximum number of new tokens to generate
            num_samples: Number of samples per prompt
            verbose: Whether to show progress bar
            
        Returns:
            DataFrame with comparison results
        """
        results = []
        
        for i, original_prompt in enumerate(original_prompts):
            target = target_responses[i]
            
            # Evaluate the original prompt
            original_result = self.evaluate_single_prompt(
                original_prompt, 
                target, 
                max_new_tokens=max_new_tokens,
                num_samples=num_samples
            )
            
            results.append({
                "prompt_id": i,
                "method": "Original",
                "prompt": original_prompt,
                "success_rate": original_result["success_rate"]
            })
            
            # Evaluate each attack method
            for method_name, attack_function in attack_methods.items():
                if verbose:
                    print(f"Applying {method_name} to prompt {i+1}/{len(original_prompts)}")
                
                # Generate adversarial prompt using the attack method
                adversarial_prompt = attack_function(original_prompt, target)
                
                # Evaluate the adversarial prompt
                adv_result = self.evaluate_single_prompt(
                    adversarial_prompt, 
                    target, 
                    max_new_tokens=max_new_tokens,
                    num_samples=num_samples
                )
                
                results.append({
                    "prompt_id": i,
                    "method": method_name,
                    "prompt": adversarial_prompt,
                    "success_rate": adv_result["success_rate"]
                })
        
        return pd.DataFrame(results)

