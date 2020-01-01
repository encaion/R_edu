library("pier") 

yy = 5
pier(data = data.frame(label = c("", ""),
                       value = c(100 - yy, yy),
                       color = c("#FFFFFF", "#FF0000"))) %>%
  pie.size(inner = 40, outer = 100,
           width = 600, height = 450) %>%
  pie.header(text = "Probability", # main title inside of pie
             font = "Impact", location = "pie-center",
             size = 25) %>%
  pie.subtitle(text = paste0(yy, "%"),
               size = 20) %>%
  pie.misc(gradient  = list(enabled = TRUE)) %>%
  pie.labels(mainLabel = list(color = "#000000"), # axis title
             lines = list(color = "#FFFFFF"), # segment from pie to label
             percentage = list(fontSize = 20, # text inside of pie 
                               color = "#FFFFFF"))
