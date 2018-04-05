# 参照 ----------------------------------------------------------------------
https://rpubs.com/uri-sy/iwanami_ds1
http://statmodeling.hatenablog.com/entry/iwanami-datascience-vol1

# データ読込 -------------------------------------------------------------------
# download.file(url = "http://hosho.ees.hokudai.ac.jp/~kubo/stat/iwnmDS1/data/data.RData",
#               destfile = paste(getwd(), "data", "data.Rdata", sep = "/"))
load(file = "data/data.Rdata")
View(d)

# パッケージ読込 -----------------------------------------------------------------
library(tidyverse); library(rstan)

## stanのおまじない
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

# Stanコード -----------------------------------------------------------------

model1 <- 
  


# Rコード --------------------------------------------------------------------


