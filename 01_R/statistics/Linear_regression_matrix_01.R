# Linear Regression

n = 1000

set.seed(1228)
df = data.frame(obs = 1:n,
                aaa = 1,
                bbb = rnorm(n),
                ccc = rnorm(n),
                eps = rnorm(n))

df[, "y"] = df$bbb - df$ccc + df$eps
head(df)
#   obs aaa        bbb         ccc         eps          y
# 1   1   1  2.1769545  1.06565789  0.52492000  1.6362166
# 2   2   1 -0.5172747  0.01667848 -0.28463385 -0.8185870
# 3   3   1 -0.1920436  0.20916719 -0.20327135 -0.6044822
# 4   4   1  0.1785140  0.70495700  0.07251835 -0.4539247
# 5   5   1  0.4002233 -1.40531986 -0.65493936  1.1506038
# 6   6   1  0.6198974 -1.16416090 -1.38251930  0.4015390


mat = as.matrix(df[, 2:4])
coef = solve(t(mat) %*% mat) %*% (t(mat) %*% df$y)
round(coef, 5)
#         [,1]
# aaa -0.05215
# bbb  0.98671
# ccc -0.94413


residual = df$y - mat %*% coef
df[, "y_2"] = df$y - mean(df$y)
R.sq = 1 - sum(residual^2) / sum(df$y_2^2)
round(R.sq, 4)
# [1] 0.6372
