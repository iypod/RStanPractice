# 参考 ----------------------------------------------------------------------
# https://rpubs.com/uri-sy/iwanami_ds1
# http://statmodeling.hatenablog.com/entry/iwanami-datascience-vol1

# データ読込 -------------------------------------------------------------------
# download.file(url = "http://hosho.ees.hokudai.ac.jp/~kubo/stat/iwnmDS1/data/data.RData",
#               destfile = paste(getwd(), "data", "data.Rdata", sep = "/"))
load(file = "data/data.Rdata")
View(d)

# パッケージ読込 -----------------------------------------------------------------
library(tidyverse); library(rstan); library(ggmcmc)

## stanのおまじない
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

# Rコード --------------------------------------------------------------------


data <- list(
  N=nrow(d),
  Mean_Y=d$mean.Y,
  X=d$X,
  Age=d$Age
)

stanmodel1 <- stan_model(file="docs/iwanamiDS1_chap1_model1.stan")

fit1 <-
  sampling(stanmodel1,
       data = data,
       iter = 1000, warmup = 200, seed = 1)

save.image()


# 可視化 ---------------------------------------------------------------------

fit1 %>% summary() %>% .$summary
fit1 %>% plot()
fit1 %>% ggs() %>% ggmcmc()
