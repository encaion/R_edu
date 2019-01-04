set.seed(123)
dd = data.frame(obs = 1:5,
                aa = paste(sample(letters[1:5], size = 5),
                           sample(letters[1:5], size = 5),
                           sample(letters[1:5], size = 5),
                           sample(letters[1:5], size = 5), sep = "_"),
                stringsAsFactors = FALSE)
head(dd)
#   obs      aa
# 1   1 b_a_e_e
# 2   2 d_c_b_a
# 3   3 e_d_c_d
# 4   4 c_b_d_c
# 5   5 a_e_a_b

ff = splitstackshape::cSplit(dd, splitCols = "aa", sep = "_")
ff
#    obs aa_1 aa_2 aa_3 aa_4
# 1:   1    b    a    e    e
# 2:   2    d    c    b    a
# 3:   3    e    d    c    d
# 4:   4    c    b    d    c
# 5:   5    a    e    a    b
