# Amygdala SEM Model Comparison Report

## 1. Analysis Overview
We compared **7 structural models** (1 Parallel + 6 Chain permutations) to determine the most plausible causal pathway. For each structure, we tested whether the path coefficients differed by disease group (Free vs. Constrained).

## 2. Best Model Selection
The **Chain Model: WFW -> ODI -> NDI -> Volume** with **Constrained** parameters was identified as the best model.

### Full Model Comparison (Sorted by AIC)

| Rank | Structure | Constraint | AIC | BIC | CFI | RMSEA |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **1** | **WFW -> ODI -> NDI -> Vol** | **Constrained** | **669.31** | **766.56** | **0.912** | **0.101** |
| 2 | WFW -> NDI -> ODI -> Vol | Constrained | 678.94 | 776.19 | 0.879 | 0.119 |
| 3 | WFW -> ODI -> NDI -> Vol | Free | 692.71 | 854.80 | 0.894 | 0.194 |
| 4 | WFW -> NDI -> ODI -> Vol | Free | 697.73 | 859.83 | 0.876 | 0.209 |
| 5 | ODI -> WFW -> NDI -> Vol | Constrained | 938.17 | 1035.43 | 0.936 | 0.114 |
| 6 | ODI -> WFW -> NDI -> Vol | Free | 943.04 | 1105.14 | 0.963 | 0.150 |
| 7 | ODI -> NDI -> WFW -> Vol | Constrained | 948.79 | 1046.05 | 0.915 | 0.131 |
| 8 | ODI -> NDI -> WFW -> Vol | Free | 958.39 | 1120.49 | 0.932 | 0.204 |
| 9 | NDI -> WFW -> ODI -> Vol | Constrained | 1419.41 | 1516.66 | 0.967 | 0.113 |
| 10 | NDI -> ODI -> WFW -> Vol | Constrained | 1425.33 | 1522.59 | 0.960 | 0.123 |
| 11 | NDI -> WFW -> ODI -> Vol | Free | 1429.48 | 1591.57 | 0.975 | 0.169 |
| 12 | NDI -> ODI -> WFW -> Vol | Free | 1439.80 | 1601.89 | 0.964 | 0.203 |
| 13 | Parallel (Vol ~ All) | Constrained | 3138.93 | 3178.55 | 1.000 | 0.000 |
| 14 | Parallel (Vol ~ All) | Free | 3154.63 | 3230.28 | 1.000 | 0.000 |

*Note: Parallel models have perfect fit indices (CFI=1, RMSEA=0) because they are saturated (or nearly saturated) structural models where all predictors correlate, but they have much higher AIC/BIC due to lack of parsimony in the regression structure compared to the chain models.*

**Key Findings:**
1.  **Structure:** The chain structure fits the data *much* better than the parallel model (AIC 669 vs 3139).
2.  **Direction:** The flow starting from WFW (`WFW -> ODI -> NDI -> Vol`) is the most supported.
3.  **Group Differences:** The **Constrained** model (AIC 669.31) is superior to the **Free** model (AIC 692.71). This indicates that **the path coefficients do NOT differ significantly between HC, MDD, and Sch.** The mechanism is stable across groups.

## 3. Path Estimates (Best Model)
*Common estimates across all groups (controlling for Age and Gender).*

| Path | Estimate | Std.Error | p-value | Interpretation |
| :--- | :--- | :--- | :--- | :--- |
| **Vol <~ NDI** | **800.44** | 1.88 | **< 0.001** | Higher NDI predicts larger Volume |
| **NDI <~ ODI** | **0.056** | 0.024 | **0.019** | Higher ODI predicts higher NDI |
| **ODI <~ WFW** | **-0.143** | 0.036 | **< 0.001** | Higher WFW predicts lower ODI |

## 5. R Code for Best Model (Constrained)

```r
# 1. Model Syntax (WFW -> ODI -> NDI -> Vol)
#    Covariates (Age, Gender) included at each step
model_syntax <- '
  vol_c ~ NDI_c + Age_c + gender_num
  NDI_c ~ ODI_c + Age_c + gender_num
  ODI_c ~ WFW_c + Age_c + gender_num
'

# 2. Run Multi-group SEM (Constrained)
#    group.equal = "regressions" forces path coefficients to be identical across groups
fit_constrained <- sem(
  model = model_syntax,
  data = dat_amy,           # Amygdala data
  group = "diag",           # Grouping variable (HC, MDD, Sch)
  group.equal = c("regressions"), 
  estimator = "ML"
)

# 3. View Results
summary(fit_constrained, standardized = TRUE, fit.measures = TRUE)
```

