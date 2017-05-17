cSplit_light = function(x, splitCol, sep, drop = TRUE){
  sep_points = gregexpr(pattern = sep, text = x[, splitCol])
  max_column = max(sapply(sep_points, "length")) + 1
  
  x[, paste0(splitCol, "_", 1:max_column)] = NA
  
  for(n_row in 1:nrow(x)){
    split_sub = strsplit(x[n_row, splitCol], split = sep)[[1]]
    x[n_row, (ncol(x) - max_column + (1:length(split_sub)))] = split_sub
  }
  
  if(drop == TRUE){
    x = x[, -1]
  }
  
  return(x)
}
