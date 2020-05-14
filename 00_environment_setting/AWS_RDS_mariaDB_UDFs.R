table_head = function(table, n = 6, conn = con){
  query = paste0("SELECT * FROM ", table, " LIMIT ", n)
  return(dbGetQuery(conn = con, query))
}

table_tail = function(table, n = 6, conn = con){
  id_max = dbGetQuery(conn = conn, paste0("SELECT MAX(id) FROM ", table))
  
  query = paste0("SELECT * FROM ", table, " WHERE id > ", id_max - n)
  return(dbGetQuery(conn = conn, query))
}

table_length = function(table, conn = con){
  query = paste0("SELECT count(*) FROM ", table)
  return(dbGetQuery(conn = conn, query))
}

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
