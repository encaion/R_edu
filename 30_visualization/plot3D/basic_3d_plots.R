library("plot3D")

box3D(1, 1, 1, -1, -1, -1)
box3D(1, 1, 1, -1, -1, -1, alpha = 0.2)

box3D(x0 = 1:5, x1 = -(1:5), 
      y0 = 1:5, y1 = -(1:5), 
      z0 = 1:5, z1 = -(1:5),
      alpha = 0.2)

box3D(x0 = 1:5, x1 = -(1:5), 
      y0 = 1:5, y1 = -(1:5), 
      z0 = 1:5, z1 = -(1:5), border = "#000000",
      alpha = 0.2)


xx = seq(-0.8, 0.8, by = 0.2)
yy = seq(-0.8, 0.8, by = 0.2)
zz = seq(-0.8, 0.8, by = 0.8)

M = mesh(x = xx, y = yy, z = zz)
x0 = M$x
y0 = M$y
z0 = M$z
x1 = x0 + 0.1

arrows3D(x0, y0, z0, x1 = x1,
         colvar = z0, col = c("red", "blue", "green"),
         lwd = 1,
         length = 0.1,
         xlim = c(-1, 1), 
         ylim = c(-1, 1))

# borders are boxes without facets  
border3D(x0 = seq(-0.8, -0.1, by = 0.1), 
         y0 = seq(-0.8, -0.1, by = 0.1),
         z0 = seq(-0.8, -0.1, by = 0.1),
         x1 = seq(0.8, 0.1, by = -0.1),
         y1 = seq(0.8, 0.1, by = -0.1),
         z1 = seq(0.8, 0.1, by = -0.1),
         col = gg.col(8), lty = 2, 
         lwd = c(1, 4), phi = 20)

box3D(x0 = seq(-0.8, -0.1, by = 0.1), 
      y0 = seq(-0.8, -0.1, by = 0.1),
      z0 = seq(-0.8, -0.1, by = 0.1),
      x1 = seq(0.8, 0.1, by = -0.1),
      y1 = seq(0.8, 0.1, by = -0.1),
      z1 = seq(0.8, 0.1, by = -0.1),
      col = rainbow(n = 8, alpha = 0.1), 
      border = "black", lwd = 2, phi = 20)

box3D(x0 = runif(3), y0 = runif(3), z0 = runif(3),
      x1 = runif(3), y1 = runif(3), z1 = runif(3),
      col = c("red", "lightblue", "orange"), alpha = 0.5,
      border = "black", lwd = 2)

rect3D(x0 = 0, y0 = 0, z0 = 0, x1 = 1, y1 = 1,
       border = "red")

rect3D(x0 = seq(-0.8, -0.1, by = 0.1),
       y0 = seq(-0.8, -0.1, by = 0.1),
       z0 = seq(-0.8, -0.1, by = 0.1),
       x1 = seq(0.8, 0.1, by = -0.1),
       y1 = seq(0.8, 0.1, by = -0.1),
       col = gg.col(8), border = "black",
       bty = "g", lwd = 2, phi = 20, main = "rect3D")
