# install.packages("plotly")
# install.packages("ggplot2")
library("plotly")
library("ggplot2")

aa = qplot(1:10, 1:10)
ggplotly(aa)
