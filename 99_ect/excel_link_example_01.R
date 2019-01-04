# install.packages("excel.link")
library("excel.link")
xl[["a1"]] = 123213

plot(1:10, 1:10)
xl[["c2"]] = current.graphics()
