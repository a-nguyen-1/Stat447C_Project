data {
  int<lower=0> n1;  // Number of cats reported lost to the Vancouver Animal Control Office
  int<lower=0> n2;  // Number of dogs reported lost to the Vancouver Animal Control Office
  int<lower=0,upper=n1> k1; // Number of cats found or matched
  int<lower=0,upper=n2> k2; // Number of dogs found or matched
}

parameters {
  real<lower=0,upper=1> prob_cat; // Probability of cat being found or matched
  real<lower=0,upper=1> prob_dog; // Probability of dog being found or matched
  real<lower=0> a_cat;  // Shape parameter alpha (cat)
  real<lower=0> b_cat;  // Shape parameter beta (cat)
  real<lower=0> a_dog;  // Shape parameter alpha (dog)
  real<lower=0> b_dog;  // Shape parameter beta (dog)
}

model {
  // priors
  a_cat ~ exponential(1);
  b_cat ~ exponential(1);
  a_dog ~ exponential(1);
  b_dog ~ exponential(1);
  prob_cat ~ beta(a_cat,b_cat);
  prob_dog ~ beta(a_dog,b_dog);

  // likelihoods
  k1 ~ binomial(n1, prob_cat);
  k2 ~ binomial(n2, prob_dog);
}

