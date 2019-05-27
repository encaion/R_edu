# 1
df = data.frame(x = rep(1:3, 2),
                y = c(1, NA, 2, NA, 3, NA))
df[which(is.na(df$y)), "y"] = df[which(is.na(df$y)) - 1, "y"]
df

# 2
df = data.frame(x = rep(1:3, 2),
                y = c(1, NA, 2, NA, 3, NA))
library("zoo")
df[, "y"] = na.locf(df$y)
df
