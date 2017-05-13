df = data.frame(aa = 1:5,
                bb = c("a", "B", NA, NA, 3),
                stringsAsFactors = FALSE)
df
#   aa   bb
# 1  1    a
# 2  2    B
# 3  3 <NA>
# 4  4 <NA>
# 5  5    3
apply(df, MARGIN = 2, function(x){sum(is.na(x))})
# aa bb 
#  0  2 
