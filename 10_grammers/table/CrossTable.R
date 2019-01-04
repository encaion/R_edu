# install.packages("gmodels")
library("gmodels")

data(infert, package = "datasets")
head(infert)

CrossTable(infert$education, infert$induced, expected = TRUE)
CrossTable(infert$education, infert$induced, expected = TRUE, format="SAS")
CrossTable(infert$education, infert$induced, expected = TRUE, format="SPSS")
CrossTable(warpbreaks$wool, warpbreaks$tension, dnn = c("Wool", "Tension"))
