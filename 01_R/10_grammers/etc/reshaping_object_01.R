# 1
library("reshape2")
library("splitstackshape")
df = data.frame(aa = rep(c("A", "B", "C"),
                         time = c(3, 4, 2)),
                bb = sample(1:10, 9))

df = aggregate(data = df, bb ~ aa, FUN = "paste", collapse = "-")
as.data.frame(cSplit(df, splitCols = "bb", sep = "-"))

# 2
library("tidyr")
library("dplyr")
df = data.frame(c1 = rep(c("A", "B", "C"), 
                         times = c(3, 4, 2)), 
                c2 = c(1, 2, 1, 1, 4, 4, 2, 4, 4))
df %>% 
  group_by(c1) %>%
  mutate(group = 1:n()) %>%
  spread(group, c2)
