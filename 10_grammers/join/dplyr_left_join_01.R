df = data.frame(shop = rep(c("교대점", "건대점"), 3),
                lon = rep(c(123.123124, 124.3453), 3),
                lat = rep(c(32.343, 30.1253), 3),
                emp = c("점장A", "직원A", "직원B",
                        "점장B", "직원C", "직원D"),
                age = c(59, 23, 25, 45, 30, 29))
df = df[order(df$shop), ]
df


df_emp = data.frame(shop = rep(c("교대점", "건대점"), 3),
                    emp = c("점장A", "직원A", "직원B",
                            "점장B", "직원C", "직원D"),
                    age = c(59, 23, 25, 45, 30, 29))
df_emp

df_shop = data.frame(shop = c("교대점", "건대점"),
                     lon = c(123.123124, 124.3453),
                     lat = c(32.343, 30.1253))
df_shop
df_emp

library("dplyr")
left_join(df_shop, df_emp, by = c("shop" = "shop"))
