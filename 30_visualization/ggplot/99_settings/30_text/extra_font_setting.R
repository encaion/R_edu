df = data.frame(x = c(1, 2, 1, 2, 1.5),
                y = c(1, 1, 2, 2, 1.5),
                text = c("left____bottom", "right____bottom", 
                         "left____top", "right____top", "center"))

library("extrafont")
font_import(pattern = "BMHANNA_11yrs_ttf")
fonts()
loadfonts("BM HANNA 11yrs old")

library("ggplot2")
ggplot(data=df, aes(x, y)) +
  geom_text(aes(label = text), 
            vjust="inward", hjust="inward") + 
  ggtitle("기본 폰트 출력 확인") + 
  theme(plot.title = element_text(size = 20))

ggplot(data=df, aes(x, y)) +
  geom_text(aes(label = text), 
            vjust="inward", hjust="inward",
            color = "#FF0000") + 
  ggtitle("기본 폰트 출력 확인") + 
  theme(plot.title = element_text(family="BM HANNA 11yrs old", size = 20))
