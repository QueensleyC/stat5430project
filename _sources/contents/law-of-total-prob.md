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

**Intuition:** Say you go to the mall to buy a trouser. The probability you buy a trouser depends on the colour of the trouser. Let us say the trouser colours come in 4 colours: black, blue, grey, and orange. The event that you buy a trouser is denoted by the red oval, and each trouser colour is represented by its colour below.

```{code-cell} ipython3
:tags: [hide-input, hide-code]

import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(5,5))

# Draw sample space as a box
ax.add_patch(patches.Rectangle((0,0), 1, 1, fill=False))

# Partition into 4 equal vertical slices
ax.add_patch(patches.Rectangle((0,0), 0.25, 1, facecolor="black", alpha=0.7, label="The Event of seeing a Black Trouser"))
ax.add_patch(patches.Rectangle((0.25,0), 0.25, 1, facecolor="skyblue", alpha=0.7, label="The Event of seeing a Blue Trouser"))
ax.add_patch(patches.Rectangle((0.5,0), 0.25, 1, facecolor="grey", alpha=0.7, label="The Event of seeing a a Grey Trouser"))
ax.add_patch(patches.Rectangle((0.75,0), 0.25, 1, facecolor="orange", alpha=0.7, label="The Event of seeing an Orange Trouser"))


# Oval (ellipse) centered at (0.5,0.5), width=0.6, height=0.3
oval = patches.Ellipse(
    (0.5, 0.5),        # center
    width=0.8, height=0.3,  # axes lengths
    fill=False,
    edgecolor="red",
    lw=2, label = "Probability you buy a Trouser"
)
ax.add_patch(oval)


ax.set_xlim(-0.1,1.1)
ax.set_ylim(-0.1,1.1)
ax.set_aspect("equal")
ax.axis("off")
ax.legend(
    loc="upper left",
    bbox_to_anchor=(1.02, 1),   # x=1.02 pushes it just outside the axes
    borderaxespad=0
)

plt.show()
```

Let the event of seeing each trouser be our $B_is$ and the event you buy one be $A$. Here you can see that the event you buy one PASSES THROUGH each event that you see a trouser. So we basically take the sum of the intersection between the oval and every rectangle.

$$
P(buy\_a\_trouser) = 
P(buy\_a\_trouser \cap black\_trouser) +
P(buy\_a\_trouser \cap blue\_trouser) +
P(buy\_a\_trouser \cap grey\_trouser) +
P(buy\_a\_trouser \cap orange\_trouser)
$$

Let buy_a_trouser = $A$, and colour of trouser = $B_i$, such that black = $B_1$, blue = $B_2$, grey = $B_3$, orange = $B_4$.

Then, we can write the above as:
$$P(A) = P(A \cap B_1) + P(A \cap B_2) + P(A \cap B_3) + P(A \cap B_4)$$

$$= \sum_{i=1}^4 P(A \cap B_i).$$
