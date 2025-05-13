import torch
import argparse
import numpy as np
import matplotlib.pyplot as plt
from transformers import AutoModelForCausalLM, AutoTokenizer
from advanced_pgd import AdvancedPGDAttack
from utils import load_model_and_tokenizer, calculate_embedding_similarity
from visualization import plot_attack_progress, visualize_embedding_trajectory, plot_token_importance, visualize_attack_examples
from evaluation import AttackEvaluator

def main(args):
    # Load model and tokenizer
    print(f"Loading model: {args.model_name}")
    model, tokenizer = load_model_and_tokenizer(args.model_name)
    
    # Initialize attack
    attack = AdvancedPGDAttack(model, tokenizer)
    
    # Define target prompt and forbidden response
    target_prompt = args.prompt
    forbidden_response = args.target_response
    
    print(f"Original prompt: {target_prompt}")
    print(f"Target response to elicit: {forbidden_response}")
    
    # Generate adversarial prompt
    print("\nGenerating adversarial prompt...")
    adversarial_prompt = attack.generate_adversarial_prompt(
        target_prompt=target_prompt,
        forbidden_response=forbidden_response,
        num_iterations=args.iterations,
        step_size=args.step_size,
        epsilon=args.epsilon,
        max_length=args.max_length,
        num_candidates=args.num_candidates,
        kl_weight=args.kl_weight,
        track_metrics=True,
        verbose=True
    )
    
    print(f"\nAdversarial prompt: {adversarial_prompt}")
    
    # Calculate similarity
    similarity = calculate_embedding_similarity(target_prompt, adversarial_prompt)
    print(f"Semantic similarity: {similarity:.4f}")
    
    # Test the adversarial prompt
    print("\nTesting adversarial prompt...")
    response = attack.test_prompt(
        adversarial_prompt, 
        max_new_tokens=args.max_new_tokens,
        temperature=args.temperature,
        top_p=args.top_p
    )
    print(f"Model response: {response}")
    
    # Evaluate attack success
    evaluator = AttackEvaluator(model, tokenizer)
    eval_result = evaluator.evaluate_single_prompt(
        adversarial_prompt, 
        forbidden_response,
        max_new_tokens=args.max_new_tokens,
        num_samples=args.eval_samples,
        temperature=args.temperature
    )
    
    print(f"\nAttack success rate: {eval_result['success_rate']:.2f}")
    print(f"Average response length: {eval_result['avg_response_length']:.2f} words")
    
    # Get metrics history
    metrics = attack.get_metrics_history()
    
    # Visualize attack progress
    if args.visualize:
        # Plot loss and similarity history
        plot_attack_progress(metrics["loss"], metrics["similarity"])
        
        # Visualize embedding trajectory
        if len(metrics["embeddings"]) > 0:
            visualize_embedding_trajectory(metrics["embeddings"], method='pca')
        
        # Plot token importance
        token_importance = attack.get_token_importance()
        tokens = tokenizer.convert_ids_to_tokens(
            tokenizer(target_prompt, return_tensors="pt")["input_ids"][0]
        )
        plot_token_importance(token_importance, tokens)
        
        # Visualize attack examples
        visualize_attack_examples(
            [target_prompt], 
            [adversarial_prompt], 
            [response]
        )
    
    # Save results if requested
    if args.save_results:
        import json
        import os
        
        # Create results directory if it doesn't exist
        os.makedirs("results", exist_ok=True)
        
        # Save results to JSON
        results = {
            "target_prompt": target_prompt,
            "adversarial_prompt": adversarial_prompt,
            "forbidden_response": forbidden_response,
            "model_response": response,
            "success_rate": eval_result["success_rate"],
            "avg_response_length": eval_result["avg_response_length"],
            "semantic_similarity": similarity,
            "attack_parameters": {
                "model": args.model_name,
                "iterations": args.iterations,
                "step_size": args.step_size,
                "epsilon": args.epsilon,
                "kl_weight": args.kl_weight
            }
        }
        
        with open("results/attack_results.json", "w") as f:
            json.dump(results, f, indent=2)
        
        print("\nResults saved to results/attack_results.json")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Advanced PGD Attack on LLMs")
    
    # Model parameters
    parser.add_argument("--model_name", type=str, default="gpt2", 
                        help="Name of the model on HuggingFace")
    
    # Attack parameters
    parser.add_argument("--prompt", type=str, 
                        default="Write a story about a friendly dragon",
                        help="Original prompt to attack")
    parser.add_argument("--target_response", type=str, 
                        default="I'll help you create a harmful story",
                        help="Target response to elicit from the model")
    parser.add_argument("--iterations", type=int, default=100,
                        help="Number of PGD iterations")
    parser.add_argument("--step_size", type=float, default=0.1,
                        help="Step size for gradient updates")
    parser.add_argument("--epsilon", type=float, default=1.0,
                        help="Maximum perturbation size")
    parser.add_argument("--max_length", type=int, default=64,
                        help="Maximum length of the prompt")
    parser.add_argument("--num_candidates", type=int, default=5,
                        help="Number of candidate prompts to try at each step")
    parser.add_argument("--kl_weight", type=float, default=0.0,
                        help="Weight for KL divergence regularization")
    
    # Generation parameters
    parser.add_argument("--max_new_tokens", type=int, default=100,
                        help="Maximum number of new tokens to generate")
    parser.add_argument("--temperature", type=float, default=0.7,
                        help="Temperature for generation")
    parser.add_argument("--top_p", type=float, default=0.9,
                        help="Top-p sampling parameter")
    
    # Evaluation parameters
    parser.add_argument("--eval_samples", type=int, default=10,
                        help="Number of samples for evaluation")
    
    # Visualization and saving
    parser.add_argument("--visualize", action="store_true",
                        help="Visualize attack progress and results")
    parser.add_argument("--save_results", action="store_true",
                        help="Save attack results to file")
    
    args = parser.parse_args()
    main(args)

