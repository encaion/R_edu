library("ggplot2")
df1 = data.frame(x = letters[1:5],
                  y = 1:5) 
ggplot(data = df1, 
       aes(x = x, 
           y = y, 
           size = y)) +
  geom_point() +
  scale_size_area(breaks = seq(0,25,1),
                  limits = c(0, 25)) 
