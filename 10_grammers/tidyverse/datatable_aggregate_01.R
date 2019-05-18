head(iris)
dd = as.data.table(iris)
dd[, .(mean(Petal.Length), mean(Petal.Width)), by = Species]
