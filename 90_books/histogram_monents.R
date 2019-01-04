library("ggplot2")
library("moments")
library("grid")
set.seed(4925)
skewness_number_1 = rnorm(1000, mean = 50, sd = 4)
skewness_df_1 = data.frame(group = 1, numbers = skewness_number_1)

skewness_number_2 = c(rnorm(300, mean = 50, sd = 8), rnorm(700, mean = 35, sd = 4))
skewness_df_2 = data.frame(group = 2, numbers = skewness_number_2)

skewness_number_3 = c(rnorm(300, mean = 50, sd = 8), rnorm(700, mean = 65, sd = 4))
skewness_df_3 = data.frame(group = 3, numbers = skewness_number_3)
skewness_df = rbind(skewness_df_1, skewness_df_2, skewness_df_3)

plot1 = ggplot(data = skewness_df[ skewness_df$group == 1, ], aes(x = numbers)) +
  geom_histogram(bins = 50, fill = "#FFFFFF", color = "#000000") + 
  xlim(c(20, 80)) + 
  theme(axis.title = element_blank(),
        axis.text.x = element_text(size = 15, face = "bold"),
        axis.text.y = element_text(size = 15, face = "bold")) + 
  annotate(geom = "text", x = 70, y = 105, size = 10,
           label = paste0("Skewness = ", round(skewness(skewness_number_1), 2)))

plot2 = ggplot(data = skewness_df[ skewness_df$group == 2, ], aes(x = numbers)) +
  geom_histogram(bins = 50, fill = "#FFFFFF", color = "#000000") + 
  xlim(c(20, 80)) + 
  theme(axis.title = element_blank(),
        axis.text.x = element_text(size = 15, face = "bold"),
        axis.text.y = element_text(size = 15, face = "bold")) + 
  annotate(geom = "text", x = 70, y = 82, size = 10,
           label = paste0("Skewness = ", round(skewness(skewness_number_2), 2)))

plot3 = ggplot(data = skewness_df[ skewness_df$group == 3, ], aes(x = numbers)) +
  geom_histogram(bins = 50, fill = "#FFFFFF", color = "#000000") + 
  xlim(c(20, 80)) + 
  theme(axis.title = element_blank(),
        axis.text.x = element_text(size = 15, face = "bold"),
        axis.text.y = element_text(size = 15, face = "bold")) + 
  annotate(geom = "text", x = 30, y = 82, size = 10,
           label = paste0("Skewness = ", round(skewness(skewness_number_3), 2)))

vplayout = function(x, y){viewport(layout.pos.row = x, layout.pos.col = y)}
grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 1)))
print(plot1, vp = vplayout(1, 1))
print(plot2, vp = vplayout(2, 1))
print(plot3, vp = vplayout(3, 1))
