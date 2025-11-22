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

# Linear Model Workflow

```{mermaid}
%%{init: {'themeVariables': { 'fontSize': '20px', 'fontFamily': 'Source Sans Pro' }}}%%
flowchart LR
    A[Simple Linear Regression] --> B[Multiple Linear Regression]
    B --> C[One-Way ANOVA]
    C --> D[Two-Way ANOVA]
    D --> E[ANCOVA]
```
This may come as a suprise but all the steps above ARE regression. Yes, ANOVA and ANCOVA are linear regression.

- ANOVA looks at means of groups, regression looks at means too (conditional mean to be specific but means all the same!)
- Regression cares about multicollinearity, ANOVA does too. That is why the groups in ANOVA have to be independent. When the groups are not independent treatments like block designs are administered.

```{mermaid}
flowchart LR

    subgraph A[Simple Linear Regression]
    end

    subgraph B[Multiple Linear Regression]
        B1[One-Way ANOVA]
        B2[Two-Way ANOVA]
        B3[ANCOVA]
        B1 --> B2 --> B3
    end

    A --> B

```

## High Level View of Multiple Linear Regression Workflow
```{mermaid}
%%{init: {'themeVariables': { 'fontSize': '20px', 'fontFamily': 'Source Sans Pro' }}}%%
flowchart LR
    A[🧩 Model Specification] --> B[🧮 Model Estimation]
    B --> C[📊 Model Inference]
    C --> D[🔍 Model Diagnostics]
    D -->|Issue Found| A

    %% BACKGROUND COLORS (earth tones)
    style A fill:#f2e9d8,stroke:#cdb897,stroke-width:1px
    style B fill:#e6d5b8,stroke:#c3ad83,stroke-width:1px
    style C fill:#d7c4a3,stroke:#b79d72,stroke-width:1px
    style D fill:#c0a988,stroke:#9e875e,stroke-width:1px
```

```{mermaid}
flowchart LR

    %% Forced starting point
    START((Start)) --> A

    subgraph A[🧩 Model Specification]
        A1[Define independent variables]
        A2[State regression assumptions]
        A1 --> A2
    end

    subgraph B[🧮 Model Estimation]
        B1[Fit the model]
        B2[Compute regression coefficients]
        B3[Goodness-of-fit tests]
        B1 --> B2 --> B3
    end

    subgraph C[📊 Model Inference]
        C1[Hypothesis tests]
        C2[Confidence intervals]
        C3[Prediction intervals]
        C1 --> C2 --> C3
    end

    subgraph D[🔍 Model Diagnostics]
        D1[Residual analysis]
        D2[Check model assumptions]
        D1 --> D2
    end

    A --> B --> C --> D

    %% Branches from D
    D -->|Issue Found| E1[Variable Selection]
    D -->|Issue Found| E2[Transformation of Dependent Variable]

    %% Loop back
    D -->|Issue Found| A

    %% BACKGROUND COLORS (earth tones)
    style A fill:#f2e9d8,stroke:#cdb897,stroke-width:1px
    style B fill:#e6d5b8,stroke:#c3ad83,stroke-width:1px
    style C fill:#d7c4a3,stroke:#b79d72,stroke-width:1px
    style D fill:#c0a988,stroke:#9e875e,stroke-width:1px
```



