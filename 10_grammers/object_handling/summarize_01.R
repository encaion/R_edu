head(iris)

library("doBy")
iris_agg = summaryBy(data = iris, formula = Sepal.Length ~ Species,
                     FUN = c(min, max, sd, var))
iris_agg
