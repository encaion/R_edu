library("ggplot2")

set.seed(1228)
df = data.frame(Company = LETTERS[1:5],
                Performance = sample(30:120, 5),
                Predict = sample(130:160, 5))

ggplot(data = df,
       aes(x = Company)) + 
  geom_col(aes(y = Predict,
               fill  = Company,
               color = Company),
           size = 2,
           alpha = 0.1,
           linetype = 3,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.77) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160)) + 
  theme_bw() +
  theme(axis.text.x = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.border = element_blank())
