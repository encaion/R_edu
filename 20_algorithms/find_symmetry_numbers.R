# 1)
df_list = expand.grid(100:999, 100:999)
df_list[, "prod"] = as.character(df_list[, 1] * df_list[, 2])
df_list[, "prod_rev"] = sapply(df_list$prod, FUN = function(x){intToUtf8(rev(utf8ToInt(x)))})
df_list_sub = df_list[df_list$prod == df_list$prod_rev, ]
head(df_list_sub)

# 2)
library("stringi")
df_list = expand.grid(100:999, 100:999)
df_list[, "prod"] = df_list[, 1] * df_list[, 2]
df_list[, "prod_rev"] = stri_reverse(df_list$prod)
df_list_sub = df_list[df_list$prod == df_list$prod_rev, ]
head(df_list_sub)
