# install.packages("clusterSim")
library("clusterSim")

set.seed(123)
df = data.frame(obs = 1:100,
                origin = sample(20:60, size = 100, replace = TRUE))
df[, "n1"] = data.Normalization(x = df$origin, type = "n1")
head(df)
#   obs origin         n1
# 1   1     31 -0.7652781
# 2   2     52  1.0303465
# 3   3     36 -0.3377484
# 4   4     56  1.3723702
# 5   5     58  1.5433820
# 6   6     21 -1.6203374

ggplot() + 
  geom_histogram(data = df, aes(x = origin), bins = 30,
                 fill = "#FFFFFF", color = "#000000",
                 alpha = 0.5)

ggplot() + 
  geom_histogram(data = df, aes(x = n1), bins = 30,
                 fill = "#FFFFFF", color = "#000000",
                 alpha = 0.5)
                 
# n1 - standardization ((x-mean)/sd)
# n2 - positional standardization ((x-median)/mad)
# n3 - unitization ((x-mean)/range)
# n3a - positional unitization ((x-median)/range)
# n4 - unitization with zero minimum ((x-min)/range)
# n5 - normalization in range <-1,1> ((x-mean)/max(abs(x-mean)))
# n5a - positional normalization in range <-1,1> ((x-median)/max(abs(x-median)))
# n6 - quotient transformation (x/sd)
# n6a - positional quotient transformation (x/mad)
# n7 - quotient transformation (x/range)
# n8 - quotient transformation (x/max)
# n9 - quotient transformation (x/mean)
# n9a - positional quotient transformation (x/median)
# n10 - quotient transformation (x/sum)
# n11 - quotient transformation (x/sqrt(SSQ))
# n12 - normalization ((x-mean)/sqrt(sum((x-mean)^2)))
# n12a - positional normalization ((x-median)/sqrt(sum((x-median)^2)))
# n13 - normalization with zero being the central point ((x-midrange)/(range/2))
