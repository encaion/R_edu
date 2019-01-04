plot_a = data.frame( xx = 1:10, yy = 31:40 )
plot_b = data.frame( xx = 1:10, yy = 15:24 )
  
plot(plot_a, ylim = c(0, 50), col = "red" , type = "b")
par(new = TRUE)
plot(plot_b, ylim = c(0, 50), col = "blue", type = "b")
