data = c(rep(0, 990), rep(1, 10))
df = data.frame(cancer = data,
                diagnosis = c(data[1:988], rep(1, 4), rep(0, 8)))
ddd = table(df)

library("caret")
confusionMatrix(ddd)
