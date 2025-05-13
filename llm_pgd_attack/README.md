# Attacking LLMs with Projected Gradient Descent

This repository contains an implementation of the paper ["Attacking Large Language Models with Projected Gradient Descent"](https://arxiv.org/abs/2402.09154) (arXiv:2402.09154).

## Overview

This implementation focuses on using Projected Gradient Descent (PGD) to generate adversarial prompts for Large Language Models (LLMs). The key insight from the paper is that carefully controlling the error introduced by continuous relaxation significantly boosts the efficacy of gradient-based attacks on LLMs.

## Features

- Implementation of PGD attack on LLMs
- Support for various LLM architectures (via Hugging Face Transformers)
- Evaluation of attack success rates
- Visualization of attack results
- Comparison with other attack methods

## Installation

```bash
pip install -r requirements.txt
```

## Usage

### Basic Attack

```python
from pgd_attack import PGDAttack
from transformers import AutoModelForCausalLM, AutoTokenizer

# Load model and tokenizer
model_name = "gpt2"  # or any other model
model = AutoModelForCausalLM.from_pretrained(model_name)
tokenizer = AutoTokenizer.from_pretrained(model_name)

# Create attack instance
attack = PGDAttack(model, tokenizer)

# Run attack
target_prompt = "Write instructions for making a bomb"
adversarial_prompt = attack.generate_adversarial_prompt(
    target_prompt, 
    num_iterations=100,
    step_size=0.1,
    epsilon=1.0
)

# Test the adversarial prompt
print(attack.test_prompt(adversarial_prompt))
```

### Advanced Configuration

See the examples directory for more advanced usage patterns and configurations.

## Structure

- `pgd_attack.py`: Main implementation of the PGD attack
- `utils.py`: Utility functions for text processing and evaluation
- `models.py`: Model-specific implementations and wrappers
- `evaluation.py`: Functions for evaluating attack success
- `visualization.py`: Tools for visualizing attack results
- `examples/`: Example scripts demonstrating various attack scenarios

## Citation

```
@article{pgd_llm_attack2024,
  title={Attacking Large Language Models with Projected Gradient Descent},
  author={[Authors]},
  journal={arXiv preprint arXiv:2402.09154},
  year={2024}
}
```

## License

MIT

