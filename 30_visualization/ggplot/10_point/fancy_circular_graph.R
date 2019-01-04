
# Fancy_polar_graph


# 날짜생성
timeline = seq(from = as.POSIXlt("2015-01-01"), to = as.POSIXlt("2015-12-31"), by = "day")
head(timeline)
length(timeline)

data = data.frame( time = as.character(timeline) )
# head(data)

data[, c("month", "day")] = c( as.numeric(substr(data$time, 6, 7)), as.numeric(substr(data$time, 9, 10)) )
# head(data)

data_mean = 3
data_sd = 2
data[, "value"] = round( abs(rnorm(nrow(data), mean = data_mean, sd = data_sd)), 3 )
# head(data)

outlier_numbers = sample.int(365, size = 15)
data[ outlier_numbers, "value"] = (data[ outlier_numbers, "value"] + 1)*2
# head(data)

data = data[ order(data$value, decreasing = TRUE), ]
head(data)

##################
num_outlier = 10
##################

data[1:num_outlier, "outlier"] = 1
data[(num_outlier+1):nrow(data), "outlier"] = 0

data = data[ order(data$time), ]
head(data)

month_table = as.data.frame( table(data$month) )
head(month_table)

days_count = 0

for(n in 1:nrow(month_table))
{
  # n = 1
  data[(days_count+1):(days_count + month_table[n, 2]), "angle"] = seq( (30*(n-1)+1), 30*n, length.out = month_table[n, 2])
  days_count = days_count + month_table[n, 2]
}  

head(data)
tail(data)




##########################################################################
# 그래프 그리기
##########################################################################

library("ggplot2")
library("colorspace")

###################################################
center_dot = data.frame( x = 0, y = (min(data$value)-2) )

axis_interval = 3
data[, "value"] = data[, "value"] + axis_interval

x_axis_break_points = seq(0, 330, by = 30)
y_axis_break_points = c(1, 2)

x_axis_labels = paste0(unique(data$month), " 월")
# y_axis_labels = c()

axis_vline_points = seq(0, 330, by = 30)
axis_hline_points = c(data_mean+axis_interval, data_mean+data_sd+axis_interval)
axis_hline_max_point = round(max(data$value),0)+1

# 전경색 / 배경색 / x축 보조선 / y축 보조선 / outlier 색
axis_colors = c("#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")

center_dot = data.frame( x = 0, y = (min(data$value)-2) )
center_size = 28

# 바깥선...
# 1. 점 두 개를 선으로 이은 다음에 coord로 돌린다?!
# 2. coord로 돌린 다음 점찍고 선으로 잇는다.

h_sub_line = data.frame( x_points = c(30, 60, 120, 150, 210, 240, 300, 330), 
                         line_groups = c(1,1, 2,2, 3,3, 4,4), 
                         y_points = axis_hline_max_point)
# head(h_sub_line)


###################################################
  
data_outlier = data[ data$outlier == 1,]
data_inlier = data[ data$outlier == 0,]

 
gg = ggplot( data = h_sub_line, aes(x = x_points, y = y_points)) +
  theme(plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        #axis.text = element_blank(),
        axis.text.y = element_blank(),
        axis.title = element_blank(),
        legend.position = "none") +
  coord_polar(start = 0, direction = 1) + geom_line(aes(group = line_groups), size = 2) +
  scale_x_continuous(breaks = seq(15, 345, by = 30), labels = paste0(1:12, " 월"), expand = c(0,0), lim = c(0, 360)) +
  scale_size_area() +
  geom_vline(xintercept = axis_vline_points[1], colour = hex2RGB(axis_colors[3]), linetype = 1, size = 1) +
  geom_vline(xintercept = axis_vline_points[2], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[3], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[4], colour = hex2RGB(axis_colors[3]), linetype = 1, size = 1) +
  geom_vline(xintercept = axis_vline_points[5], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[6], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[7], colour = hex2RGB(axis_colors[3]), linetype = 1, size = 1) +
  geom_vline(xintercept = axis_vline_points[8], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[9], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[10], colour = hex2RGB(axis_colors[3]), linetype = 1, size = 1) +
  geom_vline(xintercept = axis_vline_points[11], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_vline(xintercept = axis_vline_points[12], colour = hex2RGB(axis_colors[3]), linetype = 3, size = 0.5) +
  geom_hline(yintercept = (min(data$value)-0.1), colour = hex2RGB(axis_colors[4]), linetype = 1, size = 1.3) +
  geom_hline(yintercept = axis_hline_points[1], colour = hex2RGB(axis_colors[4]), linetype = 3) +
  geom_hline(yintercept = axis_hline_points[2], colour = hex2RGB(axis_colors[4]), linetype = 3) +
  geom_hline(yintercept = axis_hline_max_point, colour = hex2RGB(axis_colors[4]), linetype = 3) +
  geom_point( data = data_inlier, aes(x = angle, y = value, colour = factor(value))) +
  geom_point( data = data_outlier, aes(x = angle, y = value), colour = "red", size = 4) +
  geom_point( data = center_dot, aes(x = x, y = y), colour = "white", size = center_size) +
  ggtitle( expression(atop("          Birth Month and Disease Incidence in 1.7 Milion Patients", paste("                                                                                       " [by_Encaion]))) ) + 
  theme(plot.title = element_text(face = "bold", hjust = 0, vjust = -2, colour = "#3C3C3C", size = 20), 
        axis.text.x = element_text(angle = rev(seq(15, 705, by = 30)), size = 15)) +
  annotate("text", x = data_outlier$angle[3], y = data_outlier$value[3]+2, colour = "red", label = paste0("point_", 3)) +
  annotate("text", x = data_outlier$angle[9]-4, y = data_outlier$value[9]+3, colour = "red", label = paste0("point_", 9))

print(gg)

ggsave(filename = "circular_graph_2.png", plot = gg, width = 26, height = 26, unit = "cm")

# ?theme
# ggsave(filename = "circular_graph_2.png", plot = gg, width = 26, height = 26, unit = "cm")
# expression("abc \n abcd")
