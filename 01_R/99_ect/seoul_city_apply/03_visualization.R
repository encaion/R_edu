#### Visualization ####
# seoul_map
seoul_map = fread("seoul_map_stat_join_171016_16.csv", data.table = FALSE)
Encoding(seoul_map$name_kr) = "UTF-8"
head(seoul_map)

colnames(seoul_map)

#### 행정구역별 인구 시각화 ####
ggplot(data = seoul_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(aes(fill = population),
               color = "#000000") + 
  labs(fill = "인구") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.background = element_rect(fill = "#FFFFFF",
                                        color = "#888888"))

#### 행정구역별 근로자 밀집도(근로자/인구) ####
colnames(seoul_map)
ggplot(data = seoul_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(aes(fill = emp_pop_ratio),
               color = "#000000") + 
  labs(fill = "근로자\n밀집도") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.background = element_rect(fill = "#FFFFFF",
                                        color = "#888888"))

#### 행정구역별 근로자 밀집도(근로자/인구) ####
colnames(seoul_map)
ggplot(data = seoul_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(aes(fill = emp_pop_ratio),
               color = "#000000") + 
  labs(fill = "근로자\n밀집도") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.background = element_rect(fill = "#FFFFFF",
                                        color = "#888888"))

dd = seoul_map[seoul_map$emp_pop_ratio > 2.8, ]
head(dd)
unique(dd$name_kr) # 중구

#### 행정구역별 근로자/사업체 ####
colnames(seoul_map)
ggplot(data = seoul_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(aes(fill = ratio),
               color = "#000000") + 
  labs(fill = "근로자/사업체") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.background = element_rect(fill = "#FFFFFF",
                                        color = "#888888"))

#### 행정구역별 출퇴근 시간 비교 ####
colnames(seoul_map)
ggplot(data = seoul_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(aes(fill = time_mean),
               color = "#000000") + 
  labs(fill = "출퇴근시간\n(분)") +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.background = element_rect(fill = "#FFFFFF",
                                        color = "#888888"))


#### 행정구역별 차량 이동 속도 ####
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

