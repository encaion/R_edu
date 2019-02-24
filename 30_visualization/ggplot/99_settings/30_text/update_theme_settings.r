library("ggplot2")

df = data.frame(x = c(1, 2, 1, 2, 1.5),
                y = c(1, 1, 2, 2, 1.5),
                text = c("left____bottom", "right____bottom", 
                         "left____top", "right____top", "center"))

ggplot(data=df, aes(x, y)) +
  geom_text(aes(label = text), 
            vjust="inward", hjust="inward")
            
theme_update(text=element_text(size = 20))


ggplot(data=df, aes(x, y)) +
  geom_text(aes(label = text), 
            vjust="inward", hjust="inward")

