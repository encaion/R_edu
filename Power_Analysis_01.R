# install.packages("pwr")
library("pwr")

# Power calculations for proportion tests (one sample)
pwr.p.test(h = 0.2, n = NULL, sig.level = 0.05, power = 0.35,
           alternative = c("two.sided","less","greater"))


# Power calculations for correlation test
pwr.r.test(n = NULL, r = 0.8, sig.level = 0.05, power = 0.35, alternative = "two.sided")
