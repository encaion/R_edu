insert_query_gen = function(table, df){
  classes = sapply(df, FUN = "is.numeric")
  classes = as.numeric(which(classes == FALSE))
  for(n_col in classes){
    df_iris[, n_col] = as.character(df[, n_col])
    df_iris[, n_col] = paste0("'", df[, n_col], "'")
  }
  colname = paste0("(timestamp, ", paste(colnames(df), collapse = ", "), ")")
  value = apply(df, MARGIN = 1, FUN = function(x){paste0("(CURRENT_TIMESTAMP, ", paste(x, collapse = ", "), ")")})
  value = paste(value, collapse = ", ")
  query = paste("INSERT INTO", table, colname, "VALUES", value, sep = " ")
  return(query)
}
