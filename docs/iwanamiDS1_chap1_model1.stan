data {
  int N;
  real Mean_Y[N];
  real X[N];
  real Age[N];
}
    
parameters {
  real beta[3];
  real<lower=0> sigma;
}
  
transformed parameters {
  real mu[N];
  for (i in 1:N)
    mu[i] = beta[1] + (beta[2] + beta[3] * X[i]) * Age[i];
}
    
model {
  for (i in 1:N)
    Mean_Y[i] ~ normal(mu[i], sigma);
}