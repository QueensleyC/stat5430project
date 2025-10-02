---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.7
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Probability Integral Transform (PIT)

- This theorem has two key statements:
  
1. If a continuous random variable X has a well-defined CDF, $F_x$. Take samples from X and plug into the CDF, guess what? They will follow a uniform distributions. This is denoted mathematically as:

$$
U = F_X(X) \sim \text{Uniform}(0,1)
$$

2. if $U \sim \text{Uniform}(0,1)$ and $F_x$ is the CDF of a random variable $X$ then,
   $$
   X = F_x^{-1}(U)
   $$

+++

## First Statement

```{code-cell} ipython3
:tags: [hide-input]

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib.patches import FancyArrowPatch
from matplotlib.animation import FuncAnimation
```

Below are the plots of the PDF and CDF of the exponential distribution

```{code-cell} ipython3
:tags: [hide-input]

# Parameters
lam = 1.0   # rate λ
x = np.linspace(0, 5, 200)

# Exponential PDF and CDF
f_x = lam * np.exp(-lam * x)      # PDF
F_x = 1 - np.exp(-lam * x)        # CDF

# Create side-by-side plots
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12,4))

# PDF
ax1.plot(x, f_x, color="red", lw=2, label=r"$f_X(x) = \lambda e^{-\lambda x}$")
ax1.set_title("PDF of Exponential($\lambda=1$)")
ax1.set_xlabel("x")
ax1.set_ylabel("Density")
ax1.grid(True, linestyle="--", alpha=0.6)
ax1.legend()

# CDF
ax2.plot(x, F_x, color="blue", lw=2, label=r"$F_X(x) = 1 - e^{-\lambda x}$")
ax2.set_title("CDF of Exponential($\lambda=1$)")
ax2.set_xlabel("x")
ax2.set_ylabel("Cumulative Probability")
ax2.grid(True, linestyle="--", alpha=0.6)
ax2.legend()

plt.tight_layout()
plt.show()
```

By the PIT, if we take samples, in this case 10 samples, from the density function of the exponential distribution:

```{code-cell} ipython3
:tags: [hide-input]

X_samples_exp = np.random.exponential(size = 10)
print(X_samples_exp)
```

and plug them into the CDF (of the same distribution: $F_x(X) = 1-\exp^{-\lambda x}$)

```{code-cell} ipython3
:tags: [hide-input]

F_x = 1 - np.exp(-lam * X_samples_exp)  
F_x
```

We see that the distribution of these 10 samples looks normally distribution

```{code-cell} ipython3
:tags: [hide-input]

plt.vlines(F_x,0,1);
```

Increasing the sample size, we have;

```{code-cell} ipython3
:tags: [hide-input]

# Parameters
lam = 1.0
sample_sizes = [100, 1000, 10000]

fig, axes = plt.subplots(1, 3, figsize=(15, 3))

for ax, n in zip(axes, sample_sizes):
    # Sample from Exp(lam)
    X_samples_exp = np.random.exponential(scale=1/lam, size=n)
    
    # PIT: U = F_X(X) = 1 - e^{-lam * X}
    F_x = 1 - np.exp(-lam * X_samples_exp)
    
    # Plot vertical lines
    ax.vlines(F_x, 0, 1, color="blue", alpha=0.6, lw=1)
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1.1)
    ax.set_title(f"n = {n}")
    ax.set_yticks([])
    ax.set_xlabel("U = F_X(X)")

plt.suptitle("Probability Integral Transform: Exponential → Uniform(0,1)")
plt.tight_layout()
plt.show()
```

## Second Statement
