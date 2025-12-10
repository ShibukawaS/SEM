suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
  library(openxlsx)
  library(lavaan)
})

# --- 1. Data Loading ---
# Check local directory first, then fallback to Dropbox paths
local_file <- "HC_and_MDDtrim_QSM_NODDI_VOL_FINAL_v2.xlsx"
dropbox_paths <- c("D:/Dropbox/QSM_ARCS", "H:/Dropbox/QSM_ARCS")

if (file.exists(local_file)) {
  xlsx_file <- local_file
} else {
  proj_path <- dropbox_paths[file.exists(dropbox_paths)][1]
  if (is.na(proj_path)) stop("Data file not found locally or in Dropbox.")
  setwd(proj_path)
  xlsx_file <- "HC_and_MDDtrim_QSM_NODDI_VOL_FINAL_v2.xlsx"
}

# Read sheets
keep_diag <- c("HC","MDD","Sch")
ARCS_N <- read.xlsx(xlsx_file, sheet = "ARCS_n_trim") %>% filter(diag %in% keep_diag)
ARCS_P <- read.xlsx(xlsx_file, sheet = "ARCS_p_trim") %>% filter(diag %in% keep_diag)
NDI    <- read.xlsx(xlsx_file, sheet = "NDI_trim")    %>% filter(diag %in% keep_diag)
ODI    <- read.xlsx(xlsx_file, sheet = "ODI_trim")    %>% filter(diag %in% keep_diag)
WFW    <- read.xlsx(xlsx_file, sheet = "WFW_trim")    %>% filter(diag %in% keep_diag)
VOL    <- read.xlsx(xlsx_file, sheet = "vol_DWI_trim") %>% filter(diag %in% keep_diag)

# Reshape
to_long <- function(df, name) {
  df %>%
    select(-any_of(c("ID","diag","Age","gender"))) %>%
    select(where(is.numeric)) %>%
    names() -> rc
  
  df %>%
    select(ID, diag, Age, gender, all_of(rc)) %>%
    pivot_longer(cols = all_of(rc), names_to = "region", values_to = "value") %>%
    mutate(param = name)
}

vol_long <- to_long(VOL, "VOL") %>% rename(vol = value)
ndi_long <- to_long(NDI, "NDI") %>% rename(NDI = value)
odi_long <- to_long(ODI, "ODI") %>% rename(ODI = value)
wfw_long <- to_long(WFW, "WFW") %>% rename(WFW = value)
arcN_long<- to_long(ARCS_N, "ARCS_n") %>% rename(ARCS_n = value)
arcP_long<- to_long(ARCS_P, "ARCS_p") %>% rename(ARCS_p = value)

# Join
dat_all <- vol_long %>%
  inner_join(ndi_long,  by = c("ID","diag","region","Age","gender")) %>%
  inner_join(odi_long,  by = c("ID","diag","region","Age","gender")) %>%
  inner_join(wfw_long,  by = c("ID","diag","region","Age","gender")) %>%
  inner_join(arcN_long, by = c("ID","diag","region","Age","gender")) %>%
  inner_join(arcP_long, by = c("ID","diag","region","Age","gender")) %>%
  filter(if_all(c(vol,NDI,ODI,WFW,ARCS_n,ARCS_p,Age), ~ is.finite(.))) %>%
  mutate(
    across(c(vol, NDI, ODI, WFW, ARCS_n, ARCS_p, Age), ~ scale(., scale=FALSE)[,1], .names = "{.col}_c"),
    gender_num = ifelse(gender == "M", 1, 0)
  )

# Filter Amygdala
target_region <- "amygdala"
dat_amy <- dat_all %>% filter(tolower(region) == target_region)

if (nrow(dat_amy) == 0) stop("Amygdala data not found.")

# --- 2. Define Extended Model ---
# ARCS_p -> ARCS_n -> WFW -> ODI -> NDI -> Vol
model_syntax <- '
  vol_c    ~ NDI_c    + Age_c + gender_num
  NDI_c    ~ ODI_c    + Age_c + gender_num
  ODI_c    ~ WFW_c    + Age_c + gender_num
  WFW_c    ~ ARCS_n_c + Age_c + gender_num
  ARCS_n_c ~ ARCS_p_c + Age_c + gender_num
'

# --- 3. Run Analysis ---

# Free Model
fit_free <- sem(model_syntax, data = dat_amy, group = "diag", estimator = "ML")

# Constrained Model
fit_cons <- sem(model_syntax, data = dat_amy, group = "diag", group.equal = c("regressions"), estimator = "ML")

# --- 4. Compare ---
get_fit <- function(fit) {
  fm <- fitMeasures(fit, c("aic", "bic", "cfi", "rmsea"))
  c(fm["aic"], fm["bic"], fm["cfi"], fm["rmsea"])
}

res_f <- get_fit(fit_free)
res_c <- get_fit(fit_cons)

cat("=== Extended Model Comparison ===\n")
cat(sprintf("%-15s %-10s %-10s %-10s %-10s\n", "Model", "AIC", "BIC", "CFI", "RMSEA"))
cat(sprintf("%-15s %-10.2f %-10.2f %-10.3f %-10.3f\n", "Free", res_f[1], res_f[2], res_f[3], res_f[4]))
cat(sprintf("%-15s %-10.2f %-10.2f %-10.3f %-10.3f\n", "Constrained", res_c[1], res_c[2], res_c[3], res_c[4]))

best_model <- ifelse(res_c[1] < res_f[1], "Constrained", "Free")
cat("\nBest Model:", best_model, "\n")

# Save Summary
# sink("extended_model_results.txt")
cat("=== Extended Model Comparison ===\n")
cat(sprintf("%-15s %-10s %-10s %-10s %-10s\n", "Model", "AIC", "BIC", "CFI", "RMSEA"))
cat(sprintf("%-15s %-10.2f %-10.2f %-10.3f %-10.3f\n", "Free", res_f[1], res_f[2], res_f[3], res_f[4]))
cat(sprintf("%-15s %-10.2f %-10.2f %-10.3f %-10.3f\n", "Constrained", res_c[1], res_c[2], res_c[3], res_c[4]))
cat("\n")

if (best_model == "Constrained") {
  cat("--- Summary of Constrained Model ---\n")
  summary(fit_cons, standardized = TRUE, fit.measures = TRUE)
} else {
  cat("--- Summary of Free Model ---\n")
  summary(fit_free, standardized = TRUE, fit.measures = TRUE)
}
# sink()
