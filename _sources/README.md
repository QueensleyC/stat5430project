# SeeingStats

## 🧰 How to Set Up Your PC to Run This Project

### 1️⃣ Create a New Conda Environment

```bash
# (a) Create the environment
conda create -n name_of_environment python=python_version -y

# (b) Activate it
conda activate name_of_environment

# (c) Install dependencies
pip install jupyter jupyterlab jupyter-book jupytext myst-nb pre-commit nbformat nbconvert
```
> 💡 **Alternatively:**  
> If you only want to set up **JupyterBook + GitHub Pages** on your system,  
> follow this short tutorial:  
> [🎥 YouTube: How to Set Up JupyterBook and Deploy to GitHub Pages](https://youtu.be/lZ2FHTkyaMU?si=SvgEUapWUt_RjOIX)

---
## ⚠️ Important: Every Time You Create a New `.ipynb` File

- Most code lives in the **`notebooks/`** folder (as `.ipynb` files).  
- However, these notebooks are **converted to MyST Markdown (`.md`)** files that live in the **`contents/`** folder.  
- The `.md` version is what gets **deployed to GitHub Pages**.
> ⚠️ **Note:**  The MyST file and the notebook **must have the exact same filename**.

Because of this, whenever you create a new `.ipynb` file,  
you **must also create and link** a matching `.md` (MyST) version in the `contents/` folder, using the example code below:

From the **root** of your project, run:

```bash
jupytext --set-formats "notebooks//ipynb,contents//md:myst" --sync notebooks/notebook_name.ipynb
```
> 📝 **Note:**  
> Replace `notebook_name` with the **actual name** of your notebook (without spaces).  
> For example, if your notebook is called `simulation-notes.ipynb`, the command becomes:
>
> ```bash
> jupytext --set-formats "notebooks//ipynb,contents//md:myst" --sync notebooks/simulation-notes.ipynb
> ```

---
## 🧾 File Format Overview

In this project, some topics are created as **Jupyter Notebooks (`.ipynb`)** and then **converted to MyST Markdown (`.md`)**,  
while others are written directly as **pure MyST Markdown** files.

- The pages under **“.ipynb → .md”** were first developed as notebooks (to include executable code, visualizations, or analysis),  
  and then paired or converted into MyST format for JupyterBook.
- The pages under **“.md only”** were written directly in MyST Markdown without any corresponding notebook,  
  usually because they are text-based (e.g., documentation, explanations, or summaries).

---

### 📘 Project File Types Summary

| **.ipynb → .md (Paired)** | **.md Only (Text-Based)** |
|----------------------------|---------------------------|
| `law-of-total-prob` | `linear-model-workflow` |
| `probability-integral-transform`|                           |
| `probability`|                           |

> 📝 **Note:**  
> - Files in the **first column** live in the `notebooks/` folder (for `.ipynb`) and the `contents/` folder (for `.md`).  
> - Files in the **second column** exist **only** in the `contents/` folder.  
> - Each new topic should follow **one format or the other**, not both.
