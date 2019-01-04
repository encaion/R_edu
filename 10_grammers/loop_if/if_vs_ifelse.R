# data loading
data("diamonds", package = "ggplot2")
head(diamonds)

# 1
for(n in 1:nrow(diamonds)){
  if(diamonds[n, "color"] == "E"){
    diamonds[n, "color_E"] = 1
  } else {
    diamonds[n, "color_E"] = 0
  }
}

# 2
diamonds[, "color_E"] = ifelse(diamonds$color == "E", 1, 0)
