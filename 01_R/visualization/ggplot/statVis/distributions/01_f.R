library("ggplot2")
library("reshape2")
df = data.frame(xx = seq(0, 10, by = 0.05),
                yy1 = df(x = seq(0, 10, by = 0.05), df1 = 10, df2 = 1),
                yy2 = df(x = seq(0, 10, by = 0.05), df1 = 10, df2 = 2),
                yy3 = df(x = seq(0, 10, by = 0.05), df1 = 10, df2 = 5),
                yy4 = df(x = seq(0, 10, by = 0.05), df1 = 10, df2 = 10),
                yy5 = df(x = seq(0, 10, by = 0.05), df1 = 10, df2 = 20),
                yy6 = df(x = seq(0, 10, by = 0.05), df1 = 10, df2 = 40))
df_melt = melt(data = df, id.var = "xx")
head(df_melt)

ggplot(data = df_melt, 
       aes(x = xx,
           y = value,
           group = variable,
           color = variable)) + 
  geom_line(size = 1.2,
            alpha = 0.6) + 
  theme(legend.position = "none",
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank())
