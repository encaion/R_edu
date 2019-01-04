df = data.frame(time = seq(as.POSIXct("2010-01-01"), 
                           as.POSIXct("2013-01-01"),
                           by = "week"),
                value = sample(1:1000, 
                               size = 157, 
                               replace =  TRUE))
head(df)

library("ggplot2")

dates = seq(as.POSIXct("2010-01-01"), 
            as.POSIXct("2013-01-01"),
            by = "3 month")
ggplot() + 
  geom_line(data = df,
            aes(x = date(time),
                y = value),
            size = 1.4) + 
  scale_x_date(date_breaks = "3 month",
               date_minor_breaks = "1 month",
               date_labels = "%Y-%m")
