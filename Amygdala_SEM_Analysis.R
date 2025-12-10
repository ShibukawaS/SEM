# ==============================================================================
# Amygdala SEM Analysis Script
# ==============================================================================
# This script performs a Multi-group Structural Equation Modeling (SEM) analysis
# to compare different causal structures between Microstructure and Volume.
#
# Steps:
# 1. Load Data
# 2. Preprocess (Reshape to long format, Center variables)
# 3. Define Models (Parallel vs Chain models)
# 4. Run Analysis (Compare Free vs Constrained models across groups)
# 5. Output Results (AIC table and Best Model summary)
# ==============================================================================

# --- 1. Setup & Libraries ---
required_packages <- c("dplyr", "tidyr", "openxlsx", "lavaan")
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
  library(openxlsx)
  library(lavaan)
})

# --- 2. Data Loading ---
# Check local directory first, then fallback to Dropbox paths
local_file <- "HC_and_MDDtrim_QSM_NODDI_VOL_FINAL_v2.xlsx"
dropbox_paths <- c("D:/Dropbox/QSM_ARCS", "H:/Dropbox/QSM_ARCS")

if (file.exists(local_file)) {
  xlsx_file <- local_file
  cat("Using local data file:", xlsx_file, "\n")
} else {
  # Fallback logic
  proj_path <- dropbox_paths[file.exists(dropbox_paths)][1]
  if (is.na(proj_path)) stop("Data file not found locally or in Dropbox.")
  setwd(proj_path)
  xlsx_file <- local_file
  cat("Using Dropbox data file in:", getwd(), "\n")
}
if (!file.exists(xlsx_file)) stop("Data file not found: ", xlsx_file)

keep_diag <- c("HC","MDD","Sch")

# Read sheets
cat("Loading data...\n")
ARCS_N <- read.xlsx(xlsx_file, sheet = "ARCS_n_trim") %>% filter(diag %in% keep_diag)
ARCS_P <- read.xlsx(xlsx_file, sheet = "ARCS_p_trim") %>% filter(diag %in% keep_diag)
NDI    <- read.xlsx(xlsx_file, sheet = "NDI_trim")    %>% filter(diag %in% keep_diag)
ODI    <- read.xlsx(xlsx_file, sheet = "ODI_trim")    %>% filter(diag %in% keep_diag)
WFW    <- read.xlsx(xlsx_file, sheet = "WFW_trim")    %>% filter(diag %in% keep_diag)
VOL    <- read.xlsx(xlsx_file, sheet = "vol_DWI_trim") %>% filter(diag %in% keep_diag)

# --- 3. Preprocessing ---
# Function to reshape wide -> long
to_long <- function(df, name) {
  # Identify region columns (numeric columns excluding metadata)
  meta_cols <- c("ID", "diag", "Age", "gender")
  region_cols <- setdiff(names(df), meta_cols)
  region_cols <- region_cols[sapply(df[region_cols], is.numeric)]
  
  df %>%
    select(all_of(c(meta_cols, region_cols))) %>%
    pivot_longer(cols = all_of(region_cols), names_to = "region", values_to = "value") %>%
    mutate(param = name)
}

vol_long <- to_long(VOL, "VOL")    %>% rename(vol = value)
ndi_long <- to_long(NDI, "NDI")    %>% rename(NDI = value)
odi_long <- to_long(ODI, "ODI")    %>% rename(ODI = value)
wfw_long <- to_long(WFW, "WFW")    %>% rename(WFW = value)
arcN_long<- to_long(ARCS_N, "ARCS_n") %>% rename(ARCS_n = value)
arcP_long<- to_long(ARCS_P, "ARCS_p") %>% rename(ARCS_p = value)

# Join all data
dat_all <- vol_long %>%
  inner_join(ndi_long,  by = c("ID","diag","region","Age","gender")) %>%
  inner_join(odi_long,  by = c("ID","diag","region","Age","gender")) %>%
  inner_join(wfw_long,  by = c("ID","diag","region","Age","gender")) %>%
  inner_join(arcN_long, by = c("ID","diag","region","Age","gender")) %>%
  inner_join(arcP_long, by = c("ID","diag","region","Age","gender")) %>%
  filter(if_all(c(vol,NDI,ODI,WFW,ARCS_n,ARCS_p,Age), ~ is.finite(.))) %>%
  mutate(
    # Center variables (Mean=0)
    across(c(vol, NDI, ODI, WFW, ARCS_n, ARCS_p, Age), ~ scale(., scale=FALSE)[,1], .names = "{.col}_c"),
    # Gender to numeric (M=1, F=0)
    gender_num = ifelse(gender == "M", 1, 0)
  )

# Filter for Amygdala
target_region <- "amygdala"
dat_amy <- dat_all %>% filter(tolower(region) == target_region)

if (nrow(dat_amy) == 0) stop("Region 'amygdala' not found in data.")
cat("Amygdala Data: N =", nrow(dat_amy), "\n")
print(table(dat_amy$diag))

# --- 4. Define Models ---
models <- list()

# (A) Parallel Model
models[["Parallel"]] <- '
  vol_c ~ NDI_c + ODI_c + WFW_c + Age_c + gender_num
'

# (B) Chain Models (Permutations of NDI, ODI, WFW)
perms <- list(
  c("NDI_c", "ODI_c", "WFW_c"), c("NDI_c", "WFW_c", "ODI_c"),
  c("ODI_c", "NDI_c", "WFW_c"), c("ODI_c", "WFW_c", "NDI_c"),
  c("WFW_c", "NDI_c", "ODI_c"), c("WFW_c", "ODI_c", "NDI_c")
)

for (p in perms) {
  # p[1] -> p[2] -> p[3] -> Vol
  name <- paste0(gsub("_c", "", p[1]), "->", gsub("_c", "", p[2]), "->", gsub("_c", "", p[3]), "->Vol")
  syntax <- paste0(
    "vol_c ~ ", p[3], " + Age_c + gender_num\n",
    p[3], " ~ ", p[2], " + Age_c + gender_num\n",
    p[2], " ~ ", p[1], " + Age_c + gender_num\n"
  )
  models[[name]] <- syntax
}

# --- 5. Run Analysis Loop ---
cat("\nRunning model comparisons...\n")
results <- data.frame()

for (m_name in names(models)) {
  syn <- models[[m_name]]
  
  # Helper to extract fit
  get_fit <- function(fit) {
    if (inherits(fit, "try-error")) return(c(NA, NA, NA, NA, FALSE))
    fm <- fitMeasures(fit, c("aic", "bic", "cfi", "rmsea"))
    c(fm["aic"], fm["bic"], fm["cfi"], fm["rmsea"], fit@Fit@converged)
  }
  
  # 1. Free Model (Configural)
  fit_free <- try(sem(syn, data = dat_amy, group = "diag", estimator = "ML"), silent = TRUE)
  res_f <- get_fit(fit_free)
  
  # 2. Constrained Model (Metric/Regression invariance)
  fit_cons <- try(sem(syn, data = dat_amy, group = "diag", group.equal = c("regressions"), estimator = "ML"), silent = TRUE)
  res_c <- get_fit(fit_cons)
  
  results <- rbind(results, data.frame(Structure=m_name, Constraint="Free", AIC=res_f[1], BIC=res_f[2], CFI=res_f[3], RMSEA=res_f[4], Converged=res_f[5]))
  results <- rbind(results, data.frame(Structure=m_name, Constraint="Constrained", AIC=res_c[1], BIC=res_c[2], CFI=res_c[3], RMSEA=res_c[4], Converged=res_c[5]))
}

# Sort by AIC
results <- results %>% arrange(AIC) %>% mutate(across(c(AIC, BIC, CFI, RMSEA), \(x) round(x, 3)))

cat("\n=== Model Comparison Results ===\n")
print(results)

# Save results
write.csv(results, "Amygdala_SEM_Comparison_Results.csv", row.names = FALSE)
cat("\nResults saved to 'Amygdala_SEM_Comparison_Results.csv'\n")

# --- 6. Best Model Summary ---
best_row <- results[1,]
cat("\n=== Best Model Details ===\n")
cat("Structure: ", best_row$Structure, "\n")
cat("Constraint:", best_row$Constraint, "\n")

best_syn <- models[[best_row$Structure]]
is_constrained <- best_row$Constraint == "Constrained"

if (is_constrained) {
  best_fit <- sem(best_syn, data = dat_amy, group = "diag", group.equal = c("regressions"), estimator = "ML")
} else {
  best_fit <- sem(best_syn, data = dat_amy, group = "diag", estimator = "ML")
}

summary(best_fit, standardized = TRUE, fit.measures = TRUE)
