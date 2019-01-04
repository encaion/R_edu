library("ggplot2")

# Generate data
df = expand.grid(x = 1:10, y=1:10)
df[, "angle"] = seq(0, 360, length.out = 100)/180
df[, "speed"] = sqrt(seq(0.1, 3, length.out = 100)/10)

# Basic one
ggplot(df, aes(x, y)) +
  geom_spoke(aes(angle = angle,
                 radius = speed)) + 
  geom_point(shape = 1, size = 4) +
  geom_point(size = 3.7, colour = "white")
  

ggplot() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.border     = element_rect(fill = NA),
        panel.background = element_blank(),
        plot.background  = element_blank(),
        legend.position  = "none") + 
  geom_spoke(data = df,
             aes(x = x, y = y,
                 angle  = angle,
                 radius = speed)) + 
  geom_point(data = df,
             aes(x = x, y = y),
             shape = 1, size = 4) +
  geom_point(data = df,
             aes(x = x, y = y),
             size = 3.7, colour = "white") + 
  scale_x_continuous(name = "long",
                     breaks = 1:10,
                     labels = 1:10,
                     limits = c(0.3, 10.7),
                     expand = c(0.01, 0.01)) + 
  scale_y_continuous(name = "lat",
                     breaks = 1:10,
                     labels = 1:10,
                     limits = c(0.3, 10.7),
                     expand = c(0.01, 0.01)) + 
  geom_vline(xintercept = 0.5:10.5, size = 0.6, linetype = 3) + 
  geom_hline(yintercept = 0.5:10.5, size = 0.6, linetype = 3) 
