# SEM Report: Direct Path from ARCS_p to WFW

## 1. Model Structure
We tested a model where **WFW** is predicted by both **ARCS_n** and **ARCS_p** directly, in addition to the downstream chain:
`ARCS_p -> WFW -> ODI -> NDI -> Volume`
`ARCS_n -> WFW`

## 2. Model Comparison
| Model | AIC | BIC | Decision |
| :--- | :--- | :--- | :--- |
| Free | -2069.85 | -1788.88 | |
| **Constrained** | **-2097.14** | **-1931.44** | **Best Fit** |

**Result:** The **Constrained Model** is supported (Group Invariance holds).

## 3. Path Estimates (Constrained Model)
*Controlling for Age and Gender.*

| Path | Estimate | p-value | Significance |
| :--- | :--- | :--- | :--- |
| **Vol <~ NDI** | **800.44** | **< 0.001** | *** Significant |
| **NDI <~ ODI** | **0.056** | **0.019** | * Significant |
| **ODI <~ WFW** | **-0.143** | **< 0.001** | *** Significant |
| **WFW <~ ARCS_p** | **-1.079** | **0.034** | ** * Significant ** |
| **WFW <~ ARCS_n** | 0.510 | 0.452 | Not Significant |
| **ARCS_n <~ ARCS_p** | 0.041 | 0.353 | Not Significant |

## 4. Conclusion
**Important Finding:**
*   **ARCS_p (Positive) has a significant direct effect on WFW** (p = 0.034).
*   **ARCS_n (Negative) does NOT** significantly affect WFW (p = 0.452).
*   The path from ARCS_p to ARCS_n is not significant.

This suggests that **ARCS_p is the key upstream driver** in this cascade, directly influencing WFW, which then triggers the `ODI -> NDI -> Volume` pathway.
