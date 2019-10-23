# install.packages("Metrics")
library("Metrics")

truth = c(1, 2, 3, 4, 5)
pred1 = truth^2 # outlier
pred2 = truth*2

mse(truth, pred1)
mse(truth, pred2)
rmse(truth, pred1)
rmse(truth, pred2)
