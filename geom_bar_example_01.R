bar_df = data.frame(obs = 1:5,
                    value = 3:7)

library("ggplot2")
ggplot() + 
  geom_bar(data = bar_df,
           aes(x = as.factor(obs),
               y = value),
           stat = "identity")


ggplot() + 
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.border     = element_rect(fill = NA),
        panel.background = element_blank(),
         plot.background = element_blank(),
        legend.position  = "none") + 
  geom_bar(data = bar_df,
           aes(x = as.factor(obs),
               y = value,
               fill = as.factor(obs)),
           stat = "identity") + 
  geom_text(data = bar_df,
           aes(x = as.factor(obs),
               y = 0,
               label = value),
           stat = "identity",
           colour = "white",
           nudge_y = 0.5,
           size = 20) + 
  geom_text(data = bar_df,
            aes(x = as.factor(obs),
                y = 0,
                label = "◑"),
            stat = "identity",
            colour = "white",
            nudge_y = 2.5,
            size = 20) +
  geom_text(data = bar_df,
            aes(x = as.factor(obs),
                y = 0,
                label = "◑"),
            stat = "identity",
            colour = "white",
            nudge_y = 2.4,
            nudge_x = -0.06,
            size = 20,
            angle = 90) 
