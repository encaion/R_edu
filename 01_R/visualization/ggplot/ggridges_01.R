# install.packages("lubridate")
# install.packages("viridis")
# install.packages("ggridges")
library("lubridate")
library("viridis")
library("ggridges")

# download file from - https://drive.google.com/file/d/0ByOfjCmqEilLYndpOWJyZXhPVUk/view
df_weather = read.csv("weather.csv", stringsAsFactors = FALSE)
df_weather[, "Month"] = month(df_weather$CST)
df_weather[, "Month_order"] = factor(month.name[df_weather$Month],
                                     levels = month.name)

ggplot(df_weather, 
       aes(x = Mean.TemperatureF, 
           y = Month_order, 
           fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, 
                               rel_min_height = 0.01, 
                               gradient_lwd = 1) +
  scale_x_continuous(expand = c(0.01, 0.01)) +
  scale_y_discrete(  expand = c(0.01, 0.01)) +
  scale_fill_viridis(name = "Temp. [F]", option = "C") +
  labs(title = 'Temperatures in Lincoln NE') +
  theme_ridges(font_size = 13, grid = TRUE) + 
  theme(axis.title.y = element_blank())
