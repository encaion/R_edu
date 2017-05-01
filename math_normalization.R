normalization = function(x, adj = 0.5, multi = 1, na.rm = TRUE){
  x_min = min(x, na.rm = TRUE)
  x_max = max(x, na.rm = TRUE)
  x_mean = mean(x, na.rm = TRUE)
  x = ((x - x_mean)/(x_max - x_min) + adj) * multi
  return(x)
}
