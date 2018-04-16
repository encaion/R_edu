# https://guangchuangyu.github.io/2016/12/scatterpie-for-plotting-pies-on-ggplot/

library("ggplot2")
library("scatterpie")

set.seed(123)
long = rnorm(50, sd=100)
lat = rnorm(50, sd=50)
d = data.frame(long = long, lat = lat)
d = with(d, d[abs(long) < 150 & abs(lat) < 70,])
n = nrow(d)
d$region = factor(1:n)
d$A = abs(rnorm(n, sd = 1))
d$B = abs(rnorm(n, sd = 2))
d$C = abs(rnorm(n, sd = 3))
d$D = abs(rnorm(n, sd = 4))
d$radius = 6 * abs(rnorm(n))
head(d)


world = map_data("world")
p = ggplot(world, aes(long, lat)) +
    geom_map(map = world, aes(map_id = region), fill = NA, color = "black") +
    coord_quickmap()
p + geom_scatterpie(aes(x = long, y = lat, group = region, r = radius),
                    data = d, cols = LETTERS[1:4], color = NA, alpha = 0.8) +
    geom_scatterpie_legend(d$radius, x=-160, y=-55)
