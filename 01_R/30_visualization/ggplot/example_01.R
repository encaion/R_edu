# install.packages("ggplot2")
library("ggplot2")

df = data.frame(aa = 1:10,
                bb = 1:10)

gg = ggplot(data = df, aes(x = aa, y = bb)) +
  geom_line(size = 2) +
  geom_point(size = 7) + 
  geom_point(size = 5, color = "#FFFFFF") + 
  geom_point(data = data.frame(aaa = c(2, 8),
                               bbb = c(2, 8)),
             aes(x = aaa,
                 y = bbb),
             size = 5, color = "#FFFF00") + 
  scale_x_continuous(breaks = 1:10, labels = 1:10) + 
  scale_y_continuous(breaks = 1:10, labels = 1:10)

gg2 = gg + 
  geom_text(aes(y = bb - 1,
                label = LETTERS[1:10]),
            size = 8,
            angle = seq(0, 90, length.out = 10)) + 
  geom_point(aes(x = 5, y = 5.8),
             color = "#FF0000",
             size = 7,
             shape = "↓") + 
  annotate(geom = "text", x = 5, y = 6.5,
           label = "환승역", size = 7)

gg2 + 
  theme_minimal() + 
  theme(axis.text = element_text(size = 15),
        axis.title = element_text(size = 20,
                                  face = "bold"),
        plot.title = element_text(size = 25,
                                  hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5)) + 
  labs(x = "위도", y = "경도",
       title = "지하철역 위치",
       subtitle = "서울지하철")
