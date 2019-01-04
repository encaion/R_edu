library("ggplot2")
ggplot() + 
  geom_point(aes(x = 2:9,
                 y = 3,
                 color = 1:8),
             size = 50,
             alpha = 0.5) + 
  scale_x_continuous(limits = c(1, 9)) + 
  scale_y_continuous(limits = c(2, 4)) + 
  scale_color_gradient(low = "#A7DDFF", high = "#7FF1DA") +
  coord_polar() +
  theme_void() +
  theme(panel.background = element_rect(fill = "#000000"),
        legend.position = "none")
