library("ggplot2")
df = data.frame(xx = 1:3,
                yy = (1:3) * 3)

ggplot(data = df,
       aes(x = xx,
           y = yy)) + 
  geom_hline(yintercept = seq(0, max(df$yy) + 1, length.out = 13),
             color = "#EEEEEE") +
  geom_col(aes(y = max(df$yy) + 1),
           fill = "#000000",
           width = 1) + 
  geom_col(aes(y = max(df$yy) + 1,
               fill = yy,
               alpha = 0.2),
           width = 0.95) +
  geom_col(aes(fill = yy), width = 0.95) + 
  geom_point(aes(color = yy), size = 15) +
  geom_point(aes(y = 0, color = yy), size = 15) +
  scale_x_continuous(limits = c(min(df$xx) - 1, max(df$xx) + 1)) +
  scale_y_continuous(limits = c(0, max(df$yy) + 1)) +
  geom_vline(xintercept = 3.9, size = 4, color = "#EEEEEE",
             alpha = 0.4) +
  geom_vline(xintercept = 3.65, size = 5, color = "#000000") +
  coord_flip() +
  coord_polar(theta = "y") +
  theme_void() + 
  theme(legend.position = "none",
        panel.background = element_rect(fill = "#000000"))

ggsave("apple_watch_02.png", dpi = 600)
