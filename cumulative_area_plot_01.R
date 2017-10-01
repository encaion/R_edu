options(stringsAsFactors = FALSE)
library("data.table")
library("ggplot2")

df = data.frame(date = 7:13,
                share_o = c(75, 73, 100, 97, 60, 90, 85),
                share_x = c(91, 107, 124, 149, 101, 127, 91))
df[, "sum"] = df$share_o + df$share_x

df_melt = reshape2::melt(data = df, id = "date")
df_melt

ggplot() + 
  geom_area(data = df_melt,
            aes(x = date,
                y = value,
                group = variable,
                fill = variable)) + 
  geom_point(data = df,
             aes(x = date, 
                 y = share_x),
             size = 3,
             color = "#FFFFFF") +
  geom_point(data = df,
             aes(x = date, 
                 y = sum),
             size = 3,
             color = "#FFFFFF") +
  scale_x_continuous(expand = c(0.03, 0.03),
                     breaks = 7:13,
                     labels = paste0(7:13, "th")) + 
  scale_y_continuous(expand = c(0.07, 0.07)) +
  labs(x = NULL, y = NULL) + 
  annotate(geom = "text",
           x = df$date,
           y = df$sum,
           label = df$sum,
           fontface = "bold",
           size = 5,
           vjust = -0.5) +
  theme(legend.position = "bottom")

