dd = function(aa = c("A", "B", "C")){
  asdf = if(aa == "A"){
    3
  } else if(aa == "B"){
    30
  } else if(aa == "C"){
    300
  }
  return(asdf)
}

dd("B") # 30
