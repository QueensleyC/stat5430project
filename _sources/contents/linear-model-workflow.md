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
This may come as a surprise, but all of the models shown above are forms of linear regression. Yes, ANOVA and ANCOVA are linear regression.

- ANOVA compares group means, and regression also models conditional means. The structure is the same.

- Regression requires predictors to be independent, and so does ANOVA (which is why ANOVA assumes treatment groups are independent). When the groups are not independent treatments like block designs are administered.

So, if we group all of these models into broad categories, we get the following structure that we can call a linear model taxonomy:

## Linear Model Taxonomy

```{mermaid}
flowchart LR

    %% LEFT SIDE: SIMPLE LINEAR REGRESSION
    subgraph A[Simple Linear Regression]
        A0[One Predictor, One Response]
    end

    %% RIGHT SIDE: MULTIPLE LINEAR REGRESSION (with ANOVA variants)
    subgraph B[Multiple Linear Regression]
        B1[One-Way ANOVA]
        B2[Two-Way ANOVA]
        B3[ANCOVA]
        B1 --> B2 --> B3
    end

    A --> B

    %% COOL-BLUE BACKGROUNDS
    style A fill:#e8f0fe,stroke:#b7c8f0,stroke-width:1px
    style B fill:#d2e3fc,stroke:#9ab6ec,stroke-width:1px
```


## Multiple Linear Regression Workflow (High-Level View)
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

## Detailed Multiple Linear Regression Workflow
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
        B3[Goodness-of-fit checks]
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



