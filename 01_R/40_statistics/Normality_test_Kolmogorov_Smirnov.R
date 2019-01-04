x = rnorm(50); y = rnorm(50); z = runif(30)
# ks.test(x, y)
# Two-sample Kolmogorov-Smirnov test
# 
# data:  x and y
# D = 0.12, p-value = 0.8693
# alternative hypothesis: two-sided

ks.test(x, z)
# Two-sample Kolmogorov-Smirnov test
# 
# data:  x and z
# D = 0.6, p-value = 8.598e-07
# alternative hypothesis: two-sided
