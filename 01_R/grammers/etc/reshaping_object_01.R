library("reshape2")
library("splitstackshape")
df = data.frame(aa = rep(c("A", "B", "C"),
                         time = c(3, 4, 2)),
                bb = sample(1:10, 9))

df = aggregate(data = df, bb ~ aa, FUN = "paste", collapse = "-")
as.data.frame(cSplit(df, splitCols = "bb", sep = "-"))
