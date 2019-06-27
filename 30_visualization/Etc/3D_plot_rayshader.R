# https://www.tylermw.com/3d-ggplots-with-rayshader/?fbclid=IwAR0n3ME38m7J2F_LSWHgi78gHqPft91SvNyqO_4x0_KEDEJFPzg0HnghGWU

# install.packages("remotes")
# remotes::install_github("tylermorganwall/rayshader")
library("rayshader")
library("ggplot2")

gg = ggplot(diamonds, aes(x, depth)) +
  stat_density_2d(aes(fill = stat(nlevel)), 
                  geom = "polygon",
                  n = 100,bins = 10,contour = TRUE) +
  facet_wrap(clarity~.) +
  scale_fill_viridis_c(option = "A")
plot_gg(gg,multicore=TRUE,width=5,height=5,scale=250)

render_snapshot("test.png")
