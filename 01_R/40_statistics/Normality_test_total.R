z = rnorm(100)
shapiro.test(z) # Shapiro-Wilk test
# Shapiro-Wilk normality test
# 
# data:  z
# W = 0.9861, p-value = 0.3799

library("nortest")
ad.test(z) # Anderson-Darling normality test
# Anderson-Darling normality test
# 
# data:  z
# A = 0.345, p-value = 0.4787

cvm.test(z) # Cramer-von Mises normality test
# Cramer-von Mises normality test
# 
# data:  z
# W = 0.047868, p-value = 0.5381

lillie.test(z) # Lilliefors (Kolmogorov-Smirnov) test for normality
# Lilliefors (Kolmogorov-Smirnov) normality test
# 
# data:  z
# D = 0.080212, p-value = 0.1173

pearson.test(z) # Pearson chi-square test for normality
# Pearson chi-square normality test
# 
# data:  z
# P = 5.82, p-value = 0.8302

sf.test(z) # Shapiro-Francia test for normality
# Shapiro-Francia normality test
# 
# data:  z
# W = 0.98782, p-value = 0.4193
