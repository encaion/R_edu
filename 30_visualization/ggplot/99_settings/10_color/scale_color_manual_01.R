dd = data.frame(aa = 1:50,
                bb = sample(c(-10, -30, -50, -100, -130),
                            size = 50, replace = TRUE),
                cc = rnorm(50, mean = 5, sd = 3))
                
library("ggplot2")                
ggplot(data = dd,
       aes(x = aa,
           y = cc,
           group = bb,
           color = as.character(bb))) + 
  geom_line() + 
  scale_color_manual(values = c(`-10` = "#DDDDDD",
                                `-30` = "#CCCCCC",
                                `-50` = "#AAAAAA",
                                `-100` = "#666666",
                                `-130` = "#222222"))
                                
