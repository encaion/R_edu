# Exponential Distribution
library("ggplot2")
max = 20
df = data.frame(obs = 1:max,
                value_1 = dexp(x = seq(0, 1, length.out = max),
                               rate = 1),
                value_3 = dexp(x = seq(0, 1, length.out = max),
                               rate = 3),
                value_5 = dexp(x = seq(0, 1, length.out = max),
                               rate = 5),
                value_10 = dexp(x = seq(0, 1, length.out = max),
                                rate = 10))

ggplot(data = df,
       aes(x = obs)) + 
  geom_area(aes(y = value_10), alpha = 0.5, fill = "#1D3D61") + 
  geom_line(aes(y = value_10), alpha = 0.8, color = "#CCCCCC", size = 1) + 
  geom_area(aes(y = value_5), alpha = 0.5, fill = "#159491") + 
  geom_line(aes(y = value_5), alpha = 0.8, color = "#CCCCCC", size = 1) + 
  geom_area(aes(y = value_3), alpha = 0.5, fill = "#89E1FF") + 
  geom_line(aes(y = value_3), alpha = 0.8, color = "#CCCCCC", size = 1) + 
  geom_area(aes(y = value_1), alpha = 0.5, fill = "#FF6400") +
  geom_line(aes(y = value_1), alpha = 0.8, color = "#CCCCCC", size = 1)


