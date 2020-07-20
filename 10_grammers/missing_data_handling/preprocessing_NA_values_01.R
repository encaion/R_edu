df = data.frame(obs = 1:20,
                value = c(0, NA, NA, NA, 0, NA, NA, 1, 0, NA,
                          NA, 0, NA, 1, NA, 0, NA, 0, NA, 1))
df[, "value2"] = ifelse(is.na(df$value), -1, df$value)
df[, "zero"] = cumsum(ifelse(df$value2 == 0, 1, 0))

df_split = split(df, f = df$zero)

zero_check = function(x){
  x_nrow = nrow(x)
  x[2:x_nrow, "value"] = abs(sum(x[-1, "value2"]) / (x_nrow - 1))
  return(x)
}
df_split_2 = lapply(df_split, FUN = "zero_check")
df_2 = dplyr::bind_rows(df_split_2)
df_2[, "value"] = ifelse(df_2$value == 1, 1, 0)
df_2[, "origin"] = df$value
df_2
