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
