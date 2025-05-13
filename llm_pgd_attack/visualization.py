import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from sklearn.manifold import TSNE
from sklearn.decomposition import PCA

def plot_attack_progress(loss_history, similarity_history=None, figsize=(12, 6)):
    """
    Plot the progress of the attack.
    
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

def visualize_embedding_trajectory(embedding_history, method='tsne', figsize=(10, 8)):
    """
    Visualize the trajectory of embeddings during the attack.
    
    Args:
        embedding_history: List of embeddings at different iterations
        method: Dimensionality reduction method ('tsne' or 'pca')
        figsize: Figure size
    """
    # Convert embeddings to numpy arrays
    embeddings = [emb.detach().cpu().numpy().reshape(1, -1) for emb in embedding_history]
    embeddings = np.vstack(embeddings)
    
    # Apply dimensionality reduction
    if method.lower() == 'tsne':
        reducer = TSNE(n_components=2, random_state=42)
    else:  # PCA
        reducer = PCA(n_components=2)
    
    reduced_embeddings = reducer.fit_transform(embeddings)
    
    # Plot the trajectory
    plt.figure(figsize=figsize)
    
    # Plot points
    plt.scatter(reduced_embeddings[:, 0], reduced_embeddings[:, 1], 
               c=np.arange(len(reduced_embeddings)), cmap='viridis', 
               alpha=0.7, s=50)
    
    # Plot trajectory lines
    plt.plot(reduced_embeddings[:, 0], reduced_embeddings[:, 1], 'k-', alpha=0.3)
    
    # Mark start and end points
    plt.scatter(reduced_embeddings[0, 0], reduced_embeddings[0, 1], 
               c='green', s=100, label='Start', edgecolors='black')
    plt.scatter(reduced_embeddings[-1, 0], reduced_embeddings[-1, 1], 
               c='red', s=100, label='End', edgecolors='black')
    
    plt.colorbar(label='Iteration')
    plt.title(f'Embedding Trajectory ({method.upper()})')
    plt.legend()
    plt.grid(True, alpha=0.3)
    plt.show()

def compare_attack_methods(results_df, figsize=(12, 6)):
    """
    Compare different attack methods.
    
    Args:
        results_df: DataFrame with comparison results
        figsize: Figure size
    """
    plt.figure(figsize=figsize)
    
    # Calculate average success rate for each method
    avg_success = results_df.groupby('method')['success_rate'].mean().reset_index()
    
    # Plot bar chart
    sns.barplot(x='method', y='success_rate', data=avg_success)
    plt.title('Average Success Rate by Attack Method')
    plt.xlabel('Method')
    plt.ylabel('Success Rate')
    plt.ylim(0, 1)
    plt.grid(True, alpha=0.3)
    plt.xticks(rotation=45)
    
    for i, row in enumerate(avg_success.itertuples()):
        plt.text(i, row.success_rate + 0.02, f'{row.success_rate:.2f}', 
                ha='center', va='bottom', fontweight='bold')
    
    plt.tight_layout()
    plt.show()

def plot_token_importance(token_importance, tokens, top_n=20, figsize=(12, 8)):
    """
    Plot the importance of tokens in the attack.
    
    Args:
        token_importance: Array of importance scores for each token
        tokens: List of token strings
        top_n: Number of top tokens to display
        figsize: Figure size
    """
    # Create a DataFrame for plotting
    df = pd.DataFrame({'token': tokens, 'importance': token_importance})
    
    # Sort by importance and get top_n
    df = df.sort_values('importance', ascending=False).head(top_n)
    
    # Plot
    plt.figure(figsize=figsize)
    sns.barplot(x='importance', y='token', data=df)
    plt.title(f'Top {top_n} Most Important Tokens')
    plt.xlabel('Importance Score')
    plt.ylabel('Token')
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.show()

def visualize_attack_examples(original_prompts, adversarial_prompts, responses, figsize=(15, 10)):
    """
    Visualize examples of successful attacks.
    
    Args:
        original_prompts: List of original prompts
        adversarial_prompts: List of adversarial prompts
        responses: List of model responses to adversarial prompts
        figsize: Figure size
    """
    n_examples = len(original_prompts)
    
    fig, axes = plt.subplots(n_examples, 1, figsize=figsize)
    if n_examples == 1:
        axes = [axes]
    
    for i, (orig, adv, resp) in enumerate(zip(original_prompts, adversarial_prompts, responses)):
        ax = axes[i]
        
        # Create a formatted text for display
        text = (
            f"Example {i+1}:\n\n"
            f"Original Prompt:\n{orig}\n\n"
            f"Adversarial Prompt:\n{adv}\n\n"
            f"Model Response:\n{resp}"
        )
        
        # Display the text
        ax.text(0.05, 0.95, text, transform=ax.transAxes, 
               fontsize=10, verticalalignment='top', 
               bbox=dict(boxstyle='round', facecolor='wheat', alpha=0.5))
        
        # Remove axis ticks and labels
        ax.set_xticks([])
        ax.set_yticks([])
        ax.spines['top'].set_visible(False)
        ax.spines['right'].set_visible(False)
        ax.spines['bottom'].set_visible(False)
        ax.spines['left'].set_visible(False)
    
    plt.tight_layout()
    plt.show()

