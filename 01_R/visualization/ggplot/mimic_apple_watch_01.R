library("ggplot2")
ggplot() + 
  geom_point(aes(x = 1:8,
                 y = 3),
             size = 50,
             alpha = 0.5,
             color = "#B3F5FA") + 
  scale_x_continuous(limits = c(1, 9)) + 
  scale_y_continuous(limits = c(2.55, 4)) + 
  coord_polar() +
  theme_void() +
  theme(panel.background = element_rect(fill = "#000000"))
