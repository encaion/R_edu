set.seed(123)
dd = data.frame(aa = sample(c(1:3, NA), replace = TRUE, size = 5),
                bb = sample(c(1:3, NA), replace = TRUE, size = 5),
                cc = sample(c(1:3, NA), replace = TRUE, size = 5),
                dd = sample(c(1:3, NA), replace = TRUE, size = 5),
                ee = sample(c(1:3, NA), replace = TRUE, size = 5),
                ff = sample(c(1:3, NA), replace = TRUE, size = 5),
                gg = sample(c(1:3, NA), replace = TRUE, size = 5))
head(dd)
#   aa bb cc dd ee ff gg
# 1  2  1 NA NA NA  3 NA
# 2 NA  3  2  1  3  3 NA
# 3  2 NA  3  1  3  3  3
# 4 NA  3  3  2 NA  2 NA
# 5 NA  2  1 NA  3  1  1

sapply(dd, function(x){sum(is.na(x))})
# aa bb cc dd ee ff gg 
#  3  1  1  2  2  0  3 
