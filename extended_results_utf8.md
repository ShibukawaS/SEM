C:\PROGRA~1\R\R-45~1.2\bin\Rscript.exe : Warning m
essages:
発生場所 行:1 文字:1
+ C:\PROGRA~1\R\R-45~1.2\bin\Rscript.exe sem_exten
ded_arcs.R > extended ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (Warn 
   ing messages::String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
1: lavaan->lav_data_full():  
   some observed variances are (at least) a factor
 1000 times larger than 
   others; use varTable(fit) to investigate 
2: lavaan->lav_model_vcov():  
   Could not compute standard errors! The informat
ion matrix could not be 
   inverted. This may be a symptom that the model 
is not identified. 
3: lavaan->lav_lavaan_step11_estoptim():  
   Model estimation FAILED! Returning starting val
ues. 
4: lavaan->lav_lavaan_step15_baseline():  
   estimation of the baseline model failed. 
Warning messages:
1: lavaan->lav_data_full():  
   some observed variances are (at least) a factor
 1000 times larger than 
   others; use varTable(fit) to investigate 
2: lavaan->lav_lavaan_step11_estoptim():  
   Model estimation FAILED! Returning starting val
ues. 
3: lavaan->lav_lavaan_step15_baseline():  
   estimation of the baseline model failed. 
Warning messages:
1: lavaan->lav_lavaan_step11_estoptim():  
   Model estimation FAILED! Returning starting val
ues. 
2: lavaan->lav_fit_measures_check_baseline():  
   baseline model did not converge 
Warning messages:
1: lavaan->lav_lavaan_step11_estoptim():  
   Model estimation FAILED! Returning starting val
ues. 
2: lavaan->lav_fit_measures_check_baseline():  
   baseline model did not converge 
=== Extended Model Comparison ===
Model           AIC        BIC        CFI        RMSEA     
Free            -2068.32   -1798.17   NA         0.146     
Constrained     -2094.67   -1932.57   NA         0.106     

Best Model: Constrained 
=== Extended Model Comparison ===
Model           AIC        BIC        CFI        RMSEA     
Free            -2068.32   -1798.17   NA         0.146     
Constrained     -2094.67   -1932.57   NA         0.106     

--- Summary of Constrained Model ---
lavaan 0.6-20 ended normally after 411 iterations

  Estimator                                         ML
  Optimization method                           NLMINB
  Number of model parameters                        75
  Number of equality constraints                    30

  Number of observations per group:                   
    HC                                             156
    MDD                                             88
    Sch                                             27

Model Test User Model:
                                                      
  Test statistic                               121.135
  Degrees of freedom                                60
  P-value (Chi-square)                           0.000
  Test statistic for each group:
    HC                                          50.704
    MDD                                         25.454
    Sch                                         44.977

Model Test Baseline Model:

  Test statistic                                    NA
  Degrees of freedom                                NA
  P-value                                           NA

User Model versus Baseline Model:

  Comparative Fit Index (CFI)                       NA
  Tucker-Lewis Index (TLI)                          NA

Loglikelihood and Information Criteria:

  Loglikelihood user model (H0)               1092.333
  Loglikelihood unrestricted model (H1)       1152.900
                                                      
  Akaike (AIC)                               -2094.666
  Bayesian (BIC)                             -1932.570
  Sample-size adjusted Bayesian (SABIC)      -2075.252

Root Mean Square Error of Approximation:

  RMSEA                                          0.106
  90 Percent confidence interval - lower         0.079
  90 Percent confidence interval - upper         0.133
  P-value H_0: RMSEA <= 0.050                    0.001
  P-value H_0: RMSEA >= 0.080                    0.942

Standardized Root Mean Square Residual:

  SRMR                                           0.081

Parameter Estimates:

  Standard errors                             Standard
  Information                                 Expected
  Information saturated (h1) model          Structured


Group 1 [HC]:

Regressions:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
  vol_c ~                                                                   
    NDI_c   (.p1.)  800.440    0.000  9251042.490    0.000  800.440    0.137
    Age_c   (.p2.)   -3.399    0.399       -8.517    0.000   -3.399   -0.404
    gndr_nm (.p3.)   96.718    0.003    37241.204    0.000   96.718    0.507
  NDI_c ~                                                                   
    ODI_c   (.p4.)    0.056    0.024        2.346    0.019    0.056    0.117
    Age_c   (.p5.)    0.000    0.000        0.689    0.491    0.000    0.054
    gndr_nm (.p6.)    0.007    0.002        3.427    0.001    0.007    0.202
  ODI_c ~                                                                   
    WFW_c   (.p7.)   -0.143    0.036       -3.999    0.000   -0.143   -0.236
    Age_c   (.p8.)   -0.000    0.000       -0.747    0.455   -0.000   -0.057
    gndr_nm (.p9.)    0.017    0.004        3.776    0.000    0.017    0.250
  WFW_c ~                                                                   
    ARCS_n_ (.10.)    0.383    0.682        0.562    0.574    0.383    0.039
    Age_c   (.11.)   -0.000    0.000       -0.402    0.688   -0.000   -0.032
    gndr_nm (.12.)    0.020    0.008        2.614    0.009    0.020    0.181
  ARCS_n_c ~                                                                
    ARCS_p_ (.13.)    0.041    0.044        0.929    0.353    0.041    0.051
    Age_c   (.14.)    0.000    0.000        0.141    0.888    0.000    0.011
    gndr_nm (.15.)    0.003    0.001        3.528    0.000    0.003    0.241

Intercepts:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
   .vol_c          -500.315    0.008   -64869.491    0.000 -500.315   -5.242
   .NDI_c            -0.233    0.002     -109.434    0.000   -0.233  -14.308
   .ODI_c            -0.075    0.005      -15.070    0.000   -0.075   -2.220
   .WFW_c            -0.105    0.006      -17.634    0.000   -0.105   -1.865
   .ARCS_n_c          0.005    0.003        1.752    0.080    0.005    0.845

Variances:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
   .vol_c          5516.003       NA                       5516.003    0.606
   .NDI_c             0.000    0.000        8.832    0.000    0.000    0.930
   .ODI_c             0.001    0.000        8.832    0.000    0.001    0.905
   .WFW_c             0.003    0.000        8.832    0.000    0.003    0.963
   .ARCS_n_c          0.000    0.000        8.832    0.000    0.000    0.941


Group 2 [MDD]:

Regressions:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
  vol_c ~                                                                   
    NDI_c   (.p1.)  800.440    0.000  9710028.276    0.000  800.440    0.114
    Age_c   (.p2.)   -3.399    0.399       -8.517    0.000   -3.399   -0.405
    gndr_nm (.p3.)   96.718    0.003    37253.380    0.000   96.718    0.463
  NDI_c ~                                                                   
    ODI_c   (.p4.)    0.056    0.024        2.346    0.019    0.056    0.169
    Age_c   (.p5.)    0.000    0.000        0.635    0.525    0.000    0.065
    gndr_nm (.p6.)    0.007    0.002        3.427    0.001    0.007    0.221
  ODI_c ~                                                                   
    WFW_c   (.p7.)   -0.143    0.036       -3.999    0.000   -0.143   -0.239
    Age_c   (.p8.)   -0.000    0.000       -0.471    0.638   -0.000   -0.048
    gndr_nm (.p9.)    0.017    0.004        3.776    0.000    0.017    0.191
  WFW_c ~                                                                   
    ARCS_n_ (.10.)    0.383    0.682        0.562    0.574    0.383    0.028
    Age_c   (.11.)   -0.000    0.001       -0.251    0.802   -0.000   -0.026
    gndr_nm (.12.)    0.020    0.008        2.614    0.009    0.020    0.137
  ARCS_n_c ~                                                                
    ARCS_p_ (.13.)    0.041    0.044        0.929    0.353    0.041    0.057
    Age_c   (.14.)    0.000    0.000        0.127    0.899    0.000    0.013
    gndr_nm (.15.)    0.003    0.001        2.537    0.011    0.003    0.258

Intercepts:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
   .vol_c          -501.584    0.005   -99271.023    0.000 -501.584   -4.802
   .NDI_c            -0.235    0.002     -105.867    0.000   -0.235  -15.816
   .ODI_c            -0.064    0.006      -11.276    0.000   -0.064   -1.447
   .WFW_c            -0.073    0.009       -7.882    0.000   -0.073   -0.980
   .ARCS_n_c          0.007    0.003        2.411    0.016    0.007    1.220

Variances:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
   .vol_c          6539.016       NA                       6539.016    0.599
   .NDI_c             0.000    0.000        6.633    0.000    0.000    0.907
   .ODI_c             0.002    0.000        6.633    0.000    0.002    0.918
   .WFW_c             0.005    0.001        6.633    0.000    0.005    0.978
   .ARCS_n_c          0.000    0.000        6.633    0.000    0.000    0.930


Group 3 [Sch]:

Regressions:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
  vol_c ~                                                                   
    NDI_c   (.p1.)  800.440    0.000 19521770.608    0.000  800.440    0.148
    Age_c   (.p2.)   -3.399    0.399       -8.517    0.000   -3.399   -0.373
    gndr_nm (.p3.)   96.718    0.003    37385.157    0.000   96.718    0.468
  NDI_c ~                                                                   
    ODI_c   (.p4.)    0.056    0.024        2.346    0.019    0.056    0.145
    Age_c   (.p5.)    0.000    0.000        0.243    0.808    0.000    0.046
    gndr_nm (.p6.)    0.007    0.002        3.428    0.001    0.007    0.172
  ODI_c ~                                                                   
    WFW_c   (.p7.)   -0.143    0.036       -3.999    0.000   -0.143   -0.219
    Age_c   (.p8.)   -0.000    0.001       -0.212    0.832   -0.000   -0.040
    gndr_nm (.p9.)    0.017    0.004        3.777    0.000    0.017    0.173
  WFW_c ~                                                                   
    ARCS_n_ (.10.)    0.383    0.682        0.562    0.574    0.383    0.024
    Age_c   (.11.)   -0.000    0.001       -0.124    0.902   -0.000   -0.024
    gndr_nm (.12.)    0.020    0.008        2.615    0.009    0.020    0.135
  ARCS_n_c ~                                                                
    ARCS_p_ (.13.)    0.041    0.044        0.929    0.353    0.041    0.074
    Age_c   (.14.)    0.000    0.000        0.071    0.944    0.000    0.014
    gndr_nm (.15.)    0.003    0.001        2.668    0.008    0.003    0.295

Intercepts:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
   .vol_c          -537.170    0.001  -483245.773    0.000 -537.170   -5.198
   .NDI_c            -0.233    0.004      -60.164    0.000   -0.233  -12.173
   .ODI_c            -0.054    0.010       -5.485    0.000   -0.054   -1.109
   .WFW_c            -0.080    0.015       -5.239    0.000   -0.080   -1.060
   .ARCS_n_c          0.006    0.003        2.168    0.030    0.006    1.293

Variances:
                   Estimate  Std.Err  z-value      P(>|z|)   Std.lv  Std.all
   .vol_c          8086.276       NA                       8086.276    0.757
   .NDI_c             0.000    0.000        3.674    0.000    0.000    0.934
   .ODI_c             0.002    0.001        3.674    0.000    0.002    0.936
   .WFW_c             0.006    0.002        3.674    0.000    0.006    0.982
   .ARCS_n_c          0.000    0.000        3.674    0.000    0.000    0.912

Warning messages:
1: lavaan->lav_lavaan_step11_estoptim():  
   Model estimation FAILED! Returning starting val
ues. 
2: lavaan->lav_fit_measures_check_baseline():  
   baseline model did not converge 
