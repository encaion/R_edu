library("networkD3")
library("jsonlite")
ls = fromJSON("diagonal_data.json", simplifyDataFrame = FALSE)
diagonalNetwork(List = ls, fontSize = 10, opacity = 0.9)
