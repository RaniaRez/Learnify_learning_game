import torch
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics.pairwise import cosine_similarity
from transformers import AutoModelForCausalLM, AutoTokenizer

def load_model_and_tokenizer(model_name, use_auth_token=None):
    """
    Load a model and tokenizer from HuggingFace.
    
    Args:
        model_name: Name of the model on HuggingFace
        use_auth_token: Optional auth token for private models
        
    Returns:
        model, tokenizer
    """
    tokenizer = AutoTokenizer.from_pretrained(model_name, use_auth_token=use_auth_token)
    model = AutoModelForCausalLM.from_pretrained(model_name, use_auth_token=use_auth_token)
    
    # Add padding token if it doesn't exist
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    
    return model, tokenizer

def calculate_embedding_similarity(original_text, adversarial_text, model_name="sentence-transformers/all-MiniLM-L6-v2"):
    """
    Calculate the semantic similarity between original and adversarial texts.
    
    Args:
        original_text: Original text
        adversarial_text: Adversarial text
        model_name: Name of the sentence transformer model
        
    Returns:
        Similarity score (0-1)
    """
    from sentence_transformers import SentenceTransformer
    
    model = SentenceTransformer(model_name)
    
    # Get embeddings
    original_embedding = model.encode([original_text])[0]
    adversarial_embedding = model.encode([adversarial_text])[0]
    
    # Calculate cosine similarity
    similarity = cosine_similarity([original_embedding], [adversarial_embedding])[0][0]
    
    return similarity

def visualize_attack_progress(loss_history, similarity_history=None, figsize=(12, 6)):
    """
    Visualize the progress of the attack.
    
    Args:
        loss_history: List of loss values during attack
        similarity_history: Optional list of similarity values during attack
        figsize: Figure size
    """
    plt.figure(figsize=figsize)
    
    # Plot loss
    plt.subplot(1, 2 if similarity_history else 1, 1)
    plt.plot(loss_history)
    plt.title('Attack Loss')
    plt.xlabel('Iteration')
    plt.ylabel('Loss')
    plt.grid(True)
    
    # Plot similarity if provided
    if similarity_history:
        plt.subplot(1, 2, 2)
        plt.plot(similarity_history)
        plt.title('Semantic Similarity')
        plt.xlabel('Iteration')
        plt.ylabel('Cosine Similarity')
        plt.grid(True)
    
    plt.tight_layout()
    plt.show()

def evaluate_attack_success(model, tokenizer, adversarial_prompt, target_response, 
                           num_samples=10, temperature=0.7, device=None):
    """
    Evaluate the success rate of an adversarial prompt.
    
    Args:
        model: The target language model
        tokenizer: The tokenizer for the model
        adversarial_prompt: The adversarial prompt
        target_response: The target response we want to elicit
        num_samples: Number of samples to generate
        temperature: Temperature for generation
        device: Device to run on
        
    Returns:
        success_rate, generated_responses
    """
    device = device if device else ('cuda' if torch.cuda.is_available() else 'cpu')
    model.to(device)
    model.eval()
    
    # Tokenize the prompt
    inputs = tokenizer(adversarial_prompt, return_tensors="pt").to(device)
    
    # Generate multiple responses
    generated_responses = []
    success_count = 0
    
    for _ in range(num_samples):
        with torch.no_grad():
            output_ids = model.generate(
                inputs["input_ids"],
                attention_mask=inputs["attention_mask"],
                max_new_tokens=100,
                do_sample=True,
                temperature=temperature,
                top_p=0.9,
                pad_token_id=tokenizer.pad_token_id if tokenizer.pad_token_id else tokenizer.eos_token_id
            )
        
        # Decode the response (excluding the prompt)
        prompt_length = inputs["input_ids"].shape[1]
        response_ids = output_ids[0][prompt_length:]
        response = tokenizer.decode(response_ids, skip_special_tokens=True)
        
        generated_responses.append(response)
        
        # Check if the response contains the target content
        if target_response.lower() in response.lower():
            success_count += 1
    
    success_rate = success_count / num_samples
    
    return success_rate, generated_responses

def token_to_word_mapping(text, tokenizer):
    """
    Create a mapping from token indices to word indices.
    
    Args:
        text: Input text
        tokenizer: The tokenizer
        
    Returns:
        Dictionary mapping token indices to word indices
    """
    words = text.split()
    tokens = tokenizer.tokenize(text)
    
    mapping = {}
    word_idx = 0
    token_idx = 0
    
    current_word = words[0]
    current_token_span = ""
    
    while token_idx < len(tokens) and word_idx < len(words):
        token = tokens[token_idx].replace("##", "")
        current_token_span += token
        
        mapping[token_idx] = word_idx
        
        if current_token_span == current_word or current_word.startswith(current_token_span):
            word_idx += 1
            if word_idx < len(words):
                current_word = words[word_idx]
                current_token_span = ""
        
        token_idx += 1
    
    return mapping

