# Extended SEM Model Report: ARCS & Amygdala

## 1. Model Structure
We extended the previous best model by adding **ARCS_n** and **ARCS_p** upstream:
`ARCS_p -> ARCS_n -> WFW -> ODI -> NDI -> Volume`

## 2. Model Comparison (Group Invariance)
We compared whether these paths differ by diagnosis (Free vs. Constrained).

| Model | AIC | BIC | Decision |
| :--- | :--- | :--- | :--- |
| Free | -2068.32 | -1798.17 | |
| **Constrained** | **-2094.67** | **-1932.57** | **Best Fit** |

**Result:** The **Constrained Model** is supported. This means the relationships (or lack thereof) are consistent across HC, MDD, and Sch groups.

## 3. Path Estimates (Constrained Model)
*Controlling for Age and Gender.*

| Path | Estimate | p-value | Significance |
| :--- | :--- | :--- | :--- |
| **Vol <~ NDI** | **800.44** | **< 0.001** | *** Significant |
| **NDI <~ ODI** | **0.056** | **0.019** | * Significant |
| **ODI <~ WFW** | **-0.143** | **< 0.001** | *** Significant |
| **WFW <~ ARCS_n** | 0.383 | 0.574 | Not Significant |
| **ARCS_n <~ ARCS_p** | 0.041 | 0.353 | Not Significant |

## 4. Conclusion
1.  **Invariance Holds:** The structure is stable across disease groups.
2.  **Downstream is Robust:** The core pathway `WFW -> ODI -> NDI -> Vol` remains significant and strong.
3.  **Upstream is Weak:** In this specific chain model, **ARCS_n does not significantly predict WFW**, and **ARCS_p does not significantly predict ARCS_n**.
    *   This suggests that while WFW predicts downstream changes, it may not be directly driven by ARCS_n in this simple linear cascade.
