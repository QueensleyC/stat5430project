---
jupytext:
  formats: ipynb,md:myst
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

## Law of Total Probability

Let $\{B_1,\dots,B_k\}$ be a **partition** of the sample space (i.e., $B_i$ are disjoint and $\sum_i P(B_i)=1$).
For any event $A$,

$$
P(A) \;=\; \sum_{i=1}^k P(A \mid B_i)\,P(B_i) \;=\; \sum_{i=1}^k P(A \cap B_i).
$$

**Intuition.** Break the world into non-overlapping cases $B_i$. The probability of $A$ is the sum of its
probability within each case, weighted by how likely that case is.

```{code-cell} ipython3
# --- Static worked example: compute & visualize LTP for fixed numbers ---
# Goal: demonstrate P(A) = sum_i P(A|B_i) P(B_i) with a simple stacked bar plot.

import numpy as np
import matplotlib.pyplot as plt

# Example partition B = {Studied, Did not study, Cheated (for humor), Absent}
B = ["Studied", "Did not study", "Cheated", "Absent"]

# P(B_i)
p_B = np.array([0.50, 0.35, 0.05, 0.10])  # must sum to 1

# P(A | B_i), say A = "Score >= 80"
p_A_given_B = np.array([0.72, 0.18, 0.95, 0.00])

# Contributions: P(A ∩ B_i)
contrib = p_A_given_B * p_B
p_A = contrib.sum()

print(f"P(A) = {p_A:.3f}")
for bi, c in zip(B, contrib):
    print(f"  Contribution from {bi}: {c:.3f}")

# --- Plot: one stacked bar showing contributions ---
fig, ax = plt.subplots(figsize=(5,4))

bottom = 0.0
for bi, c in zip(B, contrib):
    ax.bar(["P(A)"], [c], bottom=bottom, label=bi)  # single stacked bar
    bottom += c

ax.set_ylabel("Probability")
ax.set_title("Law of Total Probability: P(A) as sum of contributions P(A ∩ B_i)")
ax.legend(title="Partition pieces", bbox_to_anchor=(1.02, 1), loc="upper left")
ax.set_ylim(0, 1)

plt.tight_layout()
plt.show()
```

```{code-cell} ipython3

```
