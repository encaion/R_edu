library("ggplot2")

df = data.frame(class = 1:3,
                value_1 = 1:3,
                value_2 = c(2, 3, 5))

ggplot(df, aes(x = class,
               fill = as.factor(value_1))) + 
  geom_vline(xintercept = 1:3 - 0.5, color = "#CCCCCC") + 
  geom_hline(yintercept = 1:(max(df$value_2) + 2), color = "#DDDDDD") + 
  geom_col(aes(y = value_2),
           alpha = 0.4,
           width = 1) + 
  geom_col(aes(y = value_1),
           alpha = 0.7,
           width = 1) + 
  geom_text(aes(y = value_2 + 1,
                label = LETTERS[1:3]),
            size = 10) + 
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) + 
  coord_polar()
