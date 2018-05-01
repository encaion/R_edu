df = data.frame(obs = 1:900,
                group = rep(paste0("Sample", 1:3), each = 300),
                period = rep(rep(c(0, 1, 24), 3), each = 100),
                value = abs(rnorm(900, mean = 2, sd = 6)))
head(df)

df_col = aggregate(value ~ group + period, FUN = "quantile", data = df)
colnames(df_col)[3:7] = paste0("v_", (0:4) * 25)

dd = df_col[, "value"]
class(dd)
