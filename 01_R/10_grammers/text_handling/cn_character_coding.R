cn_char_encoder = function(x){
  char_u = paste0(sapply(x, FUN = "utf8ToInt"))
  char_u = gsub(pattern = "[^0-9 ]", replacement = "", char_u)
  return(char_u)
}

cn_char_decoder = function(x){
  char_i = strsplit(x, split = " ")
  char_i = lapply(char_i, FUN = "as.numeric")  
  char_i = lapply(char_i, FUN = "intToUtf8")
  return(unlist(char_i))
}
