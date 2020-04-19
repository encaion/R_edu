dd = data()$results[, 3]
dd

col_check = function(x){
  x = gsub(pattern = " .*?$", replacement = "", x)
  df = get(x)
  info = list(dim = dim(df),
              colnames = colnames(df))
  return(info)
}

lapply(dd[4:8], FUN = "col_check")
