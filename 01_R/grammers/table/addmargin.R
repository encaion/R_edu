# addmargins
set.seed(123)
aa = sample(1:3, size = 100, replace = TRUE)
bb = sample(c("A", "B"), size = 100, replace = TRUE)

table(aa, bb)
#    bb
# aa   A  B
#  1  12 21
#  2  21 13
#  3  17 16

addmargins(A = table(aa, bb))
#      bb
# aa      A   B Sum
#   1    12  21  33
#   2    21  13  34
#   3    17  16  33
#   Sum  50  50 100

addmargins(A = table(aa, bb), margin = 1)
#     bb
# aa     A  B
#   1   12 21
#   2   21 13
#   3   17 16
#   Sum 50 50

addmargins(A = table(aa, bb), margin = 2)
#   bb
# aa   A  B Sum
#   1 12 21  33
#   2 21 13  34
#   3 17 16  33

addmargins(A = table(aa, bb), FUN = mean)
# Margins computed over dimensions
# in the following order:
# 1: aa
# 2: bb
#      bb
# aa            A        B     mean
#   1    12.00000 21.00000 16.50000
#   2    21.00000 13.00000 17.00000
#   3    17.00000 16.00000 16.50000
#   mean 16.66667 16.66667 16.66667

addmargins(A = table(aa, bb), FUN = mean, quiet = TRUE)
#      bb
# aa            A        B     mean
#   1    12.00000 21.00000 16.50000
#   2    21.00000 13.00000 17.00000
#   3    17.00000 16.00000 16.50000
#   mean 16.66667 16.66667 16.66667
