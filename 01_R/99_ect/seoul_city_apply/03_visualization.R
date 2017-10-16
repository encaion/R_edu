#### Visualization ####
# traffic
df_traffic = fread("traffic_velocity_2016_modified.csv", data.table = FALSE)
df_traffic = df_traffic[-nrow(df_traffic), ]
head(df_traffic)

df_traffic_mean = data.frame(name_kr = df_traffic$name_kr,
                             velo_mean = apply(df_traffic[, 3:ncol(df_traffic)],
                                               MARGIN = 1,
                                               "mean"))
df_traffic_mean = df_traffic_mean[order(df_traffic_mean$velo_mean), ]
head(df_traffic_mean)

df_traffic_melt = melt(value.name = "velo", id.vars = "name_kr", data = df_traffic[, -1])
df_traffic_melt = left_join(df_traffic_melt, df_traffic_mean,
                            by = c("name_kr" = "name_kr"))
head(df_traffic_melt)
df_traffic_melt$name_kr

ggplot() + 
  geom_hline(yintercept = (10:14) * 2, size = 1.5, color = "#FFFFFF") +
  geom_boxplot(data = df_traffic_melt,
               aes(x = factor(velo_mean),
                   y = velo,
                   color = factor(velo_mean))) +
  scale_x_discrete(breaks = df_traffic_mean$velo_mean,
                   labels = df_traffic_mean$name_kr) +
  coord_flip() + 
  theme(legend.position = "none",
        axis.title = element_text(size = 15)) + 
  labs(y = "차량 통행 속도", x = NULL)

# seoul_mapping
seoul_map = fread("seoul_map.csv", data.table = FALSE)
head(seoul_map)
