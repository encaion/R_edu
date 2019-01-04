df = data.frame(sym1 = c(90, 100, 110, 120, NA, NA),
                sym2 = c(95, NA, 89, 130, 105, NA))
mean_or_value = function(x){
  if(sum(is.na(x)) == 2){
    NA
  } else { 
    mean(x, na.rm = TRUE)
  }
}
df[, "sys"] = apply(df, MARGIN = 1, FUN = "mean_or_value")
df
