---
jupytext:
  formats: notebooks//ipynb,contents//md:myst
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
:tags: [hide-input]

import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(5,5))

# Draw sample space as a box
ax.add_patch(patches.Rectangle((0,0), 1, 1, fill=False))

# Partition: split box into two halves
ax.add_patch(patches.Rectangle((0,0), 0.5, 1, fill=True, alpha=0.2, label="B1"))
ax.add_patch(patches.Rectangle((0.5,0), 0.5, 1, fill=True, alpha=0.4, label="B2"))

# Draw event A as a circle overlapping both halves
circle = patches.Circle((0.5,0.5), 0.3, fill=False, edgecolor="red", lw=2)
ax.add_patch(circle)

ax.text(0.1, 0.5, "B1", ha="center", va="center")
ax.text(0.9, 0.5, "B2", ha="center", va="center")
ax.text(0.55, 0.75, "A", ha="center", va="center", color="red")

ax.set_xlim(-0.1,1.1)
ax.set_ylim(-0.1,1.1)
ax.set_aspect("equal")
ax.axis("off")
ax.legend()
plt.show()

```
