pair_picker = function(list){
  list = sample(list, size = length(list), replace = FALSE)
  if(length(list) %% 2 != 0){
    print(list[1])
    list = list[-1]
  } 
  pairs = as.data.frame(matrix(list, ncol = 2))
  return(pairs)
}

pair_picker(LETTERS[1:21])
