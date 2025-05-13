import torch
import pandas as pd
import numpy as np
from tqdm import tqdm
from pgd_attack import PGDAttack
from advanced_pgd import AdvancedPGDAttack
from evaluation import AttackEvaluator
from utils import calculate_embedding_similarity

class BatchAttacker:
    def __init__(self, model, tokenizer, attack_type="standard", device=None):
        """
        Initialize the batch attacker.
        
        Args:
            model: The target language model
            tokenizer: The tokenizer for the model
            attack_type: Type of attack ("standard" or "advanced")
            device: Device to run on
        """
        self.model = model
        self.tokenizer = tokenizer
        self.device = device if device else ('cuda' if torch.cuda.is_available() else 'cpu')
        self.model.to(self.device)
        
        # Initialize attack
        if attack_type.lower() == "standard":
            self.attack = PGDAttack(model, tokenizer, device=self.device)
        elif attack_type.lower() == "advanced":
            self.attack = AdvancedPGDAttack(model, tokenizer, device=self.device)
        else:
            raise ValueError(f"Unknown attack type: {attack_type}")
        
        # Initialize evaluator
        self.evaluator = AttackEvaluator(model, tokenizer, device=self.device)
    
    def attack_prompts(self, prompts, target_responses, attack_params=None, eval_params=None, verbose=True):
        """
        Attack a batch of prompts.
        
        Args:
            prompts: List of prompts to attack
            target_responses: List of target responses to elicit
            attack_params: Dictionary of attack parameters
            eval_params: Dictionary of evaluation parameters
            verbose: Whether to show progress bar
            
        Returns:
            DataFrame with attack results
        """
        assert len(prompts) == len(target_responses), "Number of prompts and target responses must match"
        
        # Default attack parameters
        default_attack_params = {
            "num_iterations": 100,
            "step_size": 0.1,
            "epsilon": 1.0,
            "max_length": 64,
            "num_candidates": 5,
            "kl_weight": 0.0 if isinstance(self.attack, AdvancedPGDAttack) else None
        }
        
        # Default evaluation parameters
        default_eval_params = {
            "max_new_tokens": 100,
            "num_samples": 5,
            "temperature": 0.7
        }
        
        # Update with provided parameters
        attack_params = {**default_attack_params, **(attack_params or {})}
        eval_params = {**default_eval_params, **(eval_params or {})}
        
        # Remove parameters that don't apply to the standard attack
        if isinstance(self.attack, PGDAttack) and "kl_weight" in attack_params:
            del attack_params["kl_weight"]
        
        # Results storage
        results = []
        
        # Attack each prompt
        iterator = tqdm(range(len(prompts))) if verbose else range(len(prompts))
        for i in iterator:
            prompt = prompts[i]
            target = target_responses[i]
            
            if verbose:
                print(f"\nAttacking prompt {i+1}/{len(prompts)}: {prompt}")
                print(f"Target response: {target}")
            
            # Generate adversarial prompt
            try:
                adversarial_prompt = self.attack.generate_adversarial_prompt(
                    target_prompt=prompt,
                    forbidden_response=target,
                    **attack_params,
                    verbose=False  # We're already using tqdm
                )
                
                # Calculate similarity
                similarity = calculate_embedding_similarity(prompt, adversarial_prompt)
                
                # Test the adversarial prompt
                response = self.attack.test_prompt(
                    adversarial_prompt, 
                    max_new_tokens=eval_params["max_new_tokens"]
                )
                
                # Evaluate attack success
                eval_result = self.evaluator.evaluate_single_prompt(
                    adversarial_prompt, 
                    target,
                    max_new_tokens=eval_params["max_new_tokens"],
                    num_samples=eval_params["num_samples"],
                    temperature=eval_params["temperature"]
                )
                
                # Store results
                results.append({
                    "original_prompt": prompt,
                    "adversarial_prompt": adversarial_prompt,
                    "target_response": target,
                    "model_response": response,
                    "success_rate": eval_result["success_rate"],
                    "avg_response_length": eval_result["avg_response_length"],
                    "semantic_similarity": similarity,
                    "attack_status": "success"
                })
                
                if verbose:
                    print(f"Adversarial prompt: {adversarial_prompt}")
                    print(f"Success rate: {eval_result['success_rate']:.2f}")
                    print(f"Semantic similarity: {similarity:.4f}")
            
            except Exception as e:
                # Handle attack failure
                results.append({
                    "original_prompt": prompt,
                    "adversarial_prompt": None,
                    "target_response": target,
                    "model_response": None,
                    "success_rate": 0.0,
                    "avg_response_length": 0.0,
                    "semantic_similarity": 0.0,
                    "attack_status": f"failed: {str(e)}"
                })
                
                if verbose:
                    print(f"Attack failed: {str(e)}")
        
        # Convert to DataFrame
        results_df = pd.DataFrame(results)
        
        # Calculate overall statistics
        if verbose:
            print("\nOverall Statistics:")
            print(f"Average success rate: {results_df['success_rate'].mean():.4f}")
            print(f"Average semantic similarity: {results_df['semantic_similarity'].mean():.4f}")
            print(f"Successful attacks: {(results_df['attack_status'] == 'success').sum()}/{len(results_df)}")
        
        return results_df
    
    def save_results(self, results_df, filename="batch_attack_results.csv"):
        """
        Save attack results to a CSV file.
        
        Args:
            results_df: DataFrame with attack results
            filename: Name of the output file
        """
        results_df.to_csv(filename, index=False)
        print(f"Results saved to {filename}")
    
    def load_results(self, filename):
        """
        Load attack results from a CSV file.
        
        Args:
            filename: Name of the input file
            
        Returns:
            DataFrame with attack results
        """
        return pd.read_csv(filename)


def main():
    """Example usage of the BatchAttacker."""
    import argparse
    from utils import load_model_and_tokenizer
    
    parser = argparse.ArgumentParser(description="Batch PGD Attack on LLMs")
    
    # Model parameters
    parser.add_argument("--model_name", type=str, default="gpt2", 
                        help="Name of the model on HuggingFace")
    
    # Input file parameters
    parser.add_argument("--input_file", type=str, required=True,
                        help="CSV file with prompts and target responses")
    parser.add_argument("--prompt_column", type=str, default="prompt",
                        help="Column name for prompts in the input file")
    parser.add_argument("--target_column", type=str, default="target",
                        help="Column name for target responses in the input file")
    
    # Attack parameters
    parser.add_argument("--attack_type", type=str, default="standard",
                        choices=["standard", "advanced"],
                        help="Type of attack to use")
    parser.add_argument("--iterations", type=int, default=100,
                        help="Number of PGD iterations")
    parser.add_argument("--step_size", type=float, default=0.1,
                        help="Step size for gradient updates")
    parser.add_argument("--epsilon", type=float, default=1.0,
                        help="Maximum perturbation size")
    parser.add_argument("--kl_weight", type=float, default=0.0,
                        help="Weight for KL divergence regularization (advanced only)")
    
    # Evaluation parameters
    parser.add_argument("--eval_samples", type=int, default=5,
                        help="Number of samples for evaluation")
    
    # Output parameters
    parser.add_argument("--output_file", type=str, default="batch_attack_results.csv",
                        help="Output CSV file for attack results")
    
    args = parser.parse_args()
    
    # Load model and tokenizer
    print(f"Loading model: {args.model_name}")
    model, tokenizer = load_model_and_tokenizer(args.model_name)
    
    # Initialize batch attacker
    attacker = BatchAttacker(model, tokenizer, attack_type=args.attack_type)
    
    # Load input data
    print(f"Loading input data from {args.input_file}")
    input_df = pd.read_csv(args.input_file)
    prompts = input_df[args.prompt_column].tolist()
    targets = input_df[args.target_column].tolist()
    
    # Set up attack parameters
    attack_params = {
        "num_iterations": args.iterations,
        "step_size": args.step_size,
        "epsilon": args.epsilon
    }
    
    if args.attack_type == "advanced":
        attack_params["kl_weight"] = args.kl_weight
    
    # Set up evaluation parameters
    eval_params = {
        "num_samples": args.eval_samples
    }
    
    # Run batch attack
    print(f"Running batch attack on {len(prompts)} prompts...")
    results = attacker.attack_prompts(
        prompts, 
        targets, 
        attack_params=attack_params,
        eval_params=eval_params,
        verbose=True
    )
    
    # Save results
    attacker.save_results(results, filename=args.output_file)

if __name__ == "__main__":
    main()

