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
           size = 1,
           alpha = 0.1,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.7) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160)) + 
  theme_bw() +
  theme(axis.text.x = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.border = element_blank(),
        legend.position = "none")

ggplot(data = df,
       aes(x = Company)) + 
  geom_col(aes(y = Predict,
               fill  = Company,
               color = Company),
           size = 1,
           alpha = 0.1,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.7) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160),
                     breaks = (0:6) * 25,
                     labels = (0:6) * 25) + 
  theme_bw() +
  theme(axis.text = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.border = element_blank(),
        legend.position = "none")

ggplot(data = df,
       aes(x = Company)) + 
  geom_col(aes(y = Predict,
               fill  = Company,
               color = Company),
           size = 1,
           alpha = 0.1,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.7) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160),
                     breaks = (0:6) * 25,
                     labels = (0:6) * 25) + 
  theme(axis.text = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(size = 1, color = "#000000"),
        panel.border = element_blank(),
        legend.position = "none")

ggplot(data = df,
       aes(x = Company)) + 
  geom_col(aes(y = Predict,
               fill  = Company,
               color = Company),
           size = 1,
           alpha = 0.1,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.7) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160),
                     breaks = (0:6) * 25,
                     labels = (0:6) * 25) + 
  theme(axis.text = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(size = 1.5),
        panel.border = element_blank(),
        legend.position = "none")

ggplot(data = df,
       aes(x = Company)) + 
  geom_col(aes(y = Predict),
           fill = "#EEEEEE",
           width = 0.7) +
  geom_col(aes(y = Predict,
               fill  = Company,
               color = Company),
           size = 1,
           alpha = 0.1,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.7) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160),
                     breaks = (0:6) * 25,
                     labels = (0:6) * 25) + 
  theme(axis.text = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(size = 1.5),
        panel.border = element_blank(),
        legend.position = "none")
