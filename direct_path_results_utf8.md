C:\PROGRA~1\R\R-45~1.2\bin\Rscript.exe : Warning m
essages:
発生場所 行:1 文字:1
+ C:\PROGRA~1\R\R-45~1.2\bin\Rscript.exe sem_direc
t_arcsp.R > direct_pa ...
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
=== Direct Path Model Comparison ===
Model           AIC        BIC        CFI        RMSEA     
Free            -2069.85   -1788.88   NA         0.147     
Constrained     -2097.14   -1931.44   NA         0.104     

Best Model: Constrained 
--- Summary of Constrained Model ---
lavaan 0.6-20 ended normally after 485 iterations

  Estimator                                         ML
  Optimization method                           NLMINB
  Number of model parameters                        78
  Number of equality constraints                    32

  Number of observations per group:                   
    HC                                             156
    MDD                                             88
    Sch                                             27

Model Test User Model:
                                                      
  Test statistic                               116.663
  Degrees of freedom                                59
  P-value (Chi-square)                           0.000
  Test statistic for each group:
    HC                                          49.136
    MDD                                         24.105
    Sch                                         43.422

Model Test Baseline Model:

  Test statistic                                    NA
  Degrees of freedom                                NA
  P-value                                           NA

User Model versus Baseline Model:

  Comparative Fit Index (CFI)                       NA
  Tucker-Lewis Index (TLI)                          NA

Loglikelihood and Information Criteria:

  Loglikelihood user model (H0)               1094.569
  Loglikelihood unrestricted model (H1)       1152.900
                                                      
  Akaike (AIC)                               -2097.138
  Bayesian (BIC)                             -1931.440
  Sample-size adjusted Bayesian (SABIC)      -2077.293

Root Mean Square Error of Approximation:

  RMSEA                                          0.104
  90 Percent confidence interval - lower         0.076
  90 Percent confidence interval - upper         0.132
  P-value H_0: RMSEA <= 0.050                    0.002
  P-value H_0: RMSEA >= 0.080                    0.923

Standardized Root Mean Square Residual:

  SRMR                                           0.078

Parameter Estimates:

  Standard errors                             Standard
  Information                                 Expected
  Information saturated (h1) model          Structured


Group 1 [HC]:

Regressions:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
  vol_c ~                                                                      
    NDI_c   (.p1.)  800.439    0.000     9249534.090    0.000  800.439    0.137
    Age_c   (.p2.)   -3.399    0.399          -8.517    0.000   -3.399   -0.404
    gndr_nm (.p3.)   96.718    0.003       37239.650    0.000   96.718    0.507
  NDI_c ~                                                                      
    ODI_c   (.p4.)    0.056    0.024           2.346    0.019    0.056    0.118
    Age_c   (.p5.)    0.000    0.000           0.689    0.491    0.000    0.054
    gndr_nm (.p6.)    0.007    0.002           3.427    0.001    0.007    0.202
  ODI_c ~                                                                      
    WFW_c   (.p7.)   -0.143    0.036          -4.001    0.000   -0.143   -0.237
    Age_c   (.p8.)   -0.000    0.000          -0.747    0.455   -0.000   -0.057
    gndr_nm (.p9.)    0.017    0.004           3.776    0.000    0.017    0.250
  WFW_c ~                                                                      
    ARCS_n_ (.10.)    0.510    0.678           0.753    0.452    0.510    0.052
    ARCS_p_ (.11.)   -1.079    0.508          -2.123    0.034   -1.079   -0.137
    Age_c   (.12.)   -0.000    0.000          -0.247    0.805   -0.000   -0.020
    gndr_nm (.13.)    0.018    0.008           2.307    0.021    0.018    0.159
  ARCS_n_c ~                                                                   
    ARCS_p_ (.14.)    0.041    0.044           0.929    0.353    0.041    0.051
    Age_c   (.15.)    0.000    0.000           0.141    0.888    0.000    0.011
    gndr_nm (.16.)    0.003    0.001           3.528    0.000    0.003    0.241

Intercepts:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
   .vol_c          -500.316    0.008      -64869.434    0.000 -500.316   -5.242
   .NDI_c            -0.233    0.002        -109.409    0.000   -0.233  -14.308
   .ODI_c            -0.075    0.005         -15.080    0.000   -0.075   -2.220
   .WFW_c            -0.173    0.032          -5.326    0.000   -0.173   -3.054
   .ARCS_n_c          0.005    0.003           1.752    0.080    0.005    0.845

Variances:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
   .vol_c          5516.003    0.000 19858434706.124    0.000 5516.003    0.606
   .NDI_c             0.000    0.000           8.832    0.000    0.000    0.930
   .ODI_c             0.001    0.000           8.832    0.000    0.001    0.905
   .WFW_c             0.003    0.000           8.832    0.000    0.003    0.945
   .ARCS_n_c          0.000    0.000           8.832    0.000    0.000    0.941


Group 2 [MDD]:

Regressions:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
  vol_c ~                                                                      
    NDI_c   (.p1.)  800.439    0.000     9709188.170    0.000  800.439    0.114
    Age_c   (.p2.)   -3.399    0.399          -8.517    0.000   -3.399   -0.405
    gndr_nm (.p3.)   96.718    0.003       37251.900    0.000   96.718    0.463
  NDI_c ~                                                                      
    ODI_c   (.p4.)    0.056    0.024           2.346    0.019    0.056    0.169
    Age_c   (.p5.)    0.000    0.000           0.635    0.525    0.000    0.065
    gndr_nm (.p6.)    0.007    0.002           3.427    0.001    0.007    0.221
  ODI_c ~                                                                      
    WFW_c   (.p7.)   -0.143    0.036          -4.001    0.000   -0.143   -0.238
    Age_c   (.p8.)   -0.000    0.000          -0.471    0.638   -0.000   -0.048
    gndr_nm (.p9.)    0.017    0.004           3.776    0.000    0.017    0.191
  WFW_c ~                                                                      
    ARCS_n_ (.10.)    0.510    0.678           0.753    0.452    0.510    0.037
    ARCS_p_ (.11.)   -1.079    0.508          -2.123    0.034   -1.079   -0.110
    Age_c   (.12.)   -0.000    0.001          -0.156    0.876   -0.000   -0.016
    gndr_nm (.13.)    0.018    0.008           2.307    0.021    0.018    0.121
  ARCS_n_c ~                                                                   
    ARCS_p_ (.14.)    0.041    0.044           0.929    0.353    0.041    0.057
    Age_c   (.15.)    0.000    0.000           0.127    0.899    0.000    0.013
    gndr_nm (.16.)    0.003    0.001           2.537    0.011    0.003    0.258

Intercepts:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
   .vol_c          -501.584    0.005      -99271.092    0.000 -501.584   -4.802
   .NDI_c            -0.235    0.002        -105.832    0.000   -0.235  -15.815
   .ODI_c            -0.064    0.006         -11.284    0.000   -0.064   -1.446
   .WFW_c            -0.136    0.031          -4.361    0.000   -0.136   -1.839
   .ARCS_n_c          0.007    0.003           2.411    0.016    0.007    1.220

Variances:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
   .vol_c          6539.017       NA                          6539.017    0.599
   .NDI_c             0.000    0.000           6.633    0.000    0.000    0.907
   .ODI_c             0.002    0.000           6.633    0.000    0.002    0.917
   .WFW_c             0.005    0.001           6.633    0.000    0.005    0.969
   .ARCS_n_c          0.000    0.000           6.633    0.000    0.000    0.930


Group 3 [Sch]:

Regressions:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
  vol_c ~                                                                      
    NDI_c   (.p1.)  800.439    0.000    19500266.509    0.000  800.439    0.148
    Age_c   (.p2.)   -3.399    0.399          -8.517    0.000   -3.399   -0.373
    gndr_nm (.p3.)   96.718    0.003       37383.673    0.000   96.718    0.468
  NDI_c ~                                                                      
    ODI_c   (.p4.)    0.056    0.024           2.346    0.019    0.056    0.144
    Age_c   (.p5.)    0.000    0.000           0.243    0.808    0.000    0.046
    gndr_nm (.p6.)    0.007    0.002           3.428    0.001    0.007    0.172
  ODI_c ~                                                                      
    WFW_c   (.p7.)   -0.143    0.036          -4.001    0.000   -0.143   -0.216
    Age_c   (.p8.)   -0.000    0.001          -0.212    0.832   -0.000   -0.040
    gndr_nm (.p9.)    0.017    0.004           3.777    0.000    0.017    0.173
  WFW_c ~                                                                      
    ARCS_n_ (.10.)    0.510    0.678           0.753    0.452    0.510    0.033
    ARCS_p_ (.11.)   -1.079    0.508          -2.123    0.034   -1.079   -0.125
    Age_c   (.12.)   -0.000    0.001          -0.078    0.938   -0.000   -0.015
    gndr_nm (.13.)    0.018    0.008           2.307    0.021    0.018    0.121
  ARCS_n_c ~                                                                   
    ARCS_p_ (.14.)    0.041    0.044           0.929    0.353    0.041    0.074
    Age_c   (.15.)    0.000    0.000           0.071    0.944    0.000    0.014
    gndr_nm (.16.)    0.003    0.001           2.668    0.008    0.003    0.295

Intercepts:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
   .vol_c          -537.170    0.001     -483246.127    0.000 -537.170   -5.198
   .NDI_c            -0.233    0.004         -60.166    0.000   -0.233  -12.174
   .ODI_c            -0.054    0.010          -5.484    0.000   -0.054   -1.111
   .WFW_c            -0.146    0.034          -4.257    0.000   -0.146   -1.973
   .ARCS_n_c          0.006    0.003           2.168    0.030    0.006    1.293

Variances:
                   Estimate  Std.Err  z-value         P(>|z|)   Std.lv  Std.all
   .vol_c          8086.276       NA                          8086.276    0.757
   .NDI_c             0.000    0.000           3.674    0.000    0.000    0.934
   .ODI_c             0.002    0.001           3.674    0.000    0.002    0.939
   .WFW_c             0.005    0.001           3.674    0.000    0.005    0.961
   .ARCS_n_c          0.000    0.000           3.674    0.000    0.000    0.912

Warning messages:
1: lavaan->lav_lavaan_step11_estoptim():  
   Model estimation FAILED! Returning starting val
ues. 
2: lavaan->lav_fit_measures_check_baseline():  
   baseline model did not converge 
