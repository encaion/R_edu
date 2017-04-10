# install.packages("tidyverse")
library("tidyverse")

tib_1 = tibble(aa = 1:5,
               bb = letters[1:5])
tib_2 = tibble(cc = 1:5,
               dd = letters[1:5])
aa = data.frame(tib_1, tib_2)
head(aa)
#   aa bb cc dd
# 1  1  a  1  a
# 2  2  b  2  b
# 3  3  c  3  c
# 4  4  d  4  d
# 5  5  e  5  e
