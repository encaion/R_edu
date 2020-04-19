# install.packages("excel.link")
library("excel.link")
xl[["a1"]] = 123213

plot(1:10, 1:10)
xl[["c2"]] = current.graphics()

xlrc[a1] = 1
xlrc["a2"] = 1

xl[a1:b5] = 2

for(n in 1:length(LETTERS)){
  xlrc[[paste0(LETTERS[n], n)]] = LETTERS[n]
}
xlrc[["a2"]] = 2
