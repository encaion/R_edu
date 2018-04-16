# https://guangchuangyu.github.io/2016/12/scatterpie-for-plotting-pies-on-ggplot/

library("ggplot2")
library("scatterpie")

world = map_data("world")
p = ggplot(world, aes(long, lat)) +
    geom_map(map = world, aes(map_id = region), fill = NA, color = "black") +
    coord_quickmap()
p + geom_scatterpie(aes(x = long, y = lat, group = region, r = radius),
                    data = d, cols = LETTERS[1:4], color = NA, alpha = 0.8) +
    geom_scatterpie_legend(d$radius, x=-160, y=-55)
