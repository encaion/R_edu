library("ggplot2")
df = data.frame(xx = 1:3,
                yy = (1:3) * 3)

ggplot(data = df,
       aes(x = xx,
           y = yy)) + 
  geom_hline(yintercept = seq(0, max(df$yy) + 1, length.out = 9),
             color = "#EEEEEE") +
  geom_col(aes(fill = yy),
           width = 0.99) + 
  geom_point(aes(color = yy),
             size = 15) +
  scale_x_continuous(limits = c(min(df$xx) - 1, max(df$xx) + 0.5)) +
  scale_y_continuous(limits = c(0, max(df$yy) + 1)) +
  geom_vline(xintercept = c(0.5:2.5), size = 1, color = "#EEEEEE") +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 3.5, size = 3, color = "#CCCCCC") +
  coord_flip() +
  coord_polar(theta = "y") +
  theme_void() + 
  theme(legend.position = "none")
