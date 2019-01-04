options(stringsAsFactors = FALSE)
library("ggplot2")
library("reshape2")
library("binhf")

tri_data = rep(c(seq(51, 150, length.out = 100), 
                 seq(150, 51, length.out = 100)), 4)

df_origin = data.frame(obs = 1:length(tri_data),
                       input = tri_data,
                       output = shift(tri_data, places = 100, dir = "right"))
df_melt = melt(data = df_origin, id.vars = "obs", variable.name = "type")

ggplot(data = df_melt,
       aes(x = obs,
           y = value,
           color = type,
           group = type)) + 
  geom_line(size = 1.2) + 
  scale_color_manual(values = c("input" = "#FF0000", 
                                "output" = "#0000FF"))

var(df_origin$input)
mean((df_origin$input - df_origin$output)^2) # mse


# 반복문
tri_data = rep(c(seq(51, 150, length.out = 100), 
                 seq(150, 51, length.out = 100)), 4)

df_cal = data.frame()

for(n in 1:200){  
  mse = mean((tri_data - shift(tri_data, places = n, dir = "right"))^2)
  df_cal = rbind(df_cal, data.frame(mse  = mse,
                                    rmse = sqrt(mse)))
}
df_cal[, "var"] = var(tri_data)
df_cal[,  "sd"] =  sd(tri_data)
df_cal[, "diff_var"] = abs(df_cal$var - df_cal$mse)
df_cal[, "diff_sd" ] = abs(df_cal$sd  - df_cal$rmse)
head(df_cal)

ggplot(data = df_cal,
       aes(x = 1:nrow(df_cal),
           y = df_cal$mse)) + 
  geom_hline(yintercept = var(tri_data),
             size = 2) + 
  geom_line(color = "#5555FF", size = 1.3)
