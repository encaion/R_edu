df = data.frame(x = c(1, 2, 1, 2, 1.5),
                y = c(1, 1, 2, 2, 1.5),
                text = c("좌측하단", "우측하단", "좌측상단", "우측상단", "가운데"))

ggplot(data = df, aes(x, y)) +
  geom_text(aes(label = text), vjust="inward", hjust="inward")
