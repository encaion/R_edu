test = function(x, FUN = "mean"){
  return(do.call(FUN, list(x)))
}
test(1:10)
# [1] 5.5
