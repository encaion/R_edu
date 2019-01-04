data = data.frame(grade = rep(c(LETTERS[1:4], "F"), times = c(30, 40, 30, 15, 5)))
data_table = as.numeric(table(data))

library("ggplot2")
ggplot() + 
  geom_col(aes(x = "",
               y = data_table,
               fill = factor(5:1,
                             labels = paste0(c(LETTERS[1:4], "F"), " 학점")))) + 
  geom_text(aes(x = "",
                y = cumsum(data_table),
                label = paste0(round(data_table / sum(data_table) * 100), "%")),
            fontface = "bold",
            color = c("#0000FF", rep("#FFFF00", 4))) +
  scale_fill_manual(values = c("#FF0000", "#FF4040", "#FF8080", "#FFAAAA", "#FFCCCC")) +
  scale_y_continuous(expand = c(0.1, 0.1),
                     breaks = quantile(c(0, sum(data_table))),
                     labels = paste0(seq(0, 100, by = 25),
                                     "%")) +
  scale_x_discrete(expand = c(0.2, 0.2)) +
  labs(fill = "성적") +
  coord_flip() +
  theme_bw() + 
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())
