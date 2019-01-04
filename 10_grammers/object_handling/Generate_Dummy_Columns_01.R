# Generate Dummy Columns

df = data.frame(obs = 1:100,
                aaa = sample(letters[1:3], size = 100, replace = TRUE),
                bbb = sample(c("Type_X", "Type_Y"), size = 100, replace = TRUE),
                stringsAsFactors = FALSE)
head(df)

library("nnet")
head(class.ind(df$aaa))
#      a b c
# [1,] 1 0 0
# [2,] 0 0 1
# [3,] 1 0 0
# [4,] 1 0 0
# [5,] 0 0 1
# [6,] 0 0 1

df_bind = cbind(df, aaa = class.ind(df$aaa))
head(df_bind)
#   obs aaa    bbb aaa.a aaa.b aaa.c
# 1   1   a Type_X     1     0     0
# 2   2   c Type_Y     0     0     1
# 3   3   a Type_X     1     0     0
# 4   4   a Type_Y     1     0     0
# 5   5   c Type_X     0     0     1
# 6   6   c Type_Y     0     0     1
