# Server
library("shiny")
library("ggplot2")

server = function(input, output){
  
  #### define functions ####
  color_extractor = function(url_png, colors = 3){
    
    url_Content = RCurl::getURLContent(input$input_image_url)
    png = png::readPNG(url_Content, native = FALSE)
    
    for(col in 1:3){
      col_sub = png[, , col]
      col_sub = cbind(line = nrow(col_sub):1,
                      as.data.frame(col_sub))
      if(col == 1){
        col_melt = reshape2::melt(data = col_sub,
                                  id.vars = "line")
      } else {
        col_melt[, ncol(col_melt) + 1] = reshape2::melt(data = col_sub,
                                                        id.vars = "line")[, "value"]
      }
    }
    
    col_melt[, "variable"] = as.numeric(substr(col_melt[, "variable"], 2, 4))
    colnames(col_melt)[3:5] = c("Red", "Green", "Blue")
    col_melt[, "obs"] = 1:nrow(col_melt)
    
    kmeans_result = kmeans(x = col_melt[, 3:5], centers = colors)
    
    df = data.frame(x = 1,
                    y = 1:colors)
    df = cbind(df, kmeans_result$centers)
    df[, "Hex"] = rgb(red   = df[, 3],
                      green = df[, 4],
                      blue  = df[, 5])

    gg = ggplot(data = df,
                aes(x = x,
                    y = y)) + 
      geom_tile(aes(fill = Hex)) + 
      geom_text(aes(label = Hex), size = 10) + 
      scale_fill_identity() + 
      scale_x_continuous(expand = c(0, 0)) + 
      scale_y_continuous(expand = c(0, 0)) + 
      theme(legend.position = "none",
            axis.title = element_blank(),
            axis.text = element_blank())
    return(list(plot = gg,
                data = col_melt,
                colors = df))
  }
  
  switches = reactiveValues(plotting = 0)
  
  observeEvent(input$summit, {
    switches$plotting = input$summit
  })  
  
  
  output$plot_01 = renderPlot({
    if(switches$plotting == FALSE){
      ggplot() + 
        theme(plot.background = element_blank(),
              panel.background = element_blank())
    } else {
      isolate({
        ggplot() + 
          geom_tile(data = color_extractor(url_png = input$input_image_url, colors = 5)[["data"]],
                    aes(x = variable,
                        y = line,
                        fill = rgb(Red, Green, Blue))) + 
          scale_fill_identity() +
          scale_x_continuous(expand = c(0, 0)) + 
          scale_y_continuous(expand = c(0, 0)) + 
          theme(legend.position = "none",
                axis.title = element_blank(),
                axis.text = element_blank())
      })
    }
  })
  
  output$plot_02 = renderPlot({
    if(switches$plotting == FALSE){
      ggplot() + 
        theme(plot.background = element_blank(),
              panel.background = element_blank())
    } else {
      isolate({
        color_extractor(url_png = input$input_image_url,
                        colors  = input$input_color_n)[["plot"]]
      })
    }
  })
  
  
  output$DT = renderDataTable({
    if(switches$plotting == FALSE){
      data.frame(obs = 1:3,
                 Red = 1,
                 Green = 1,
                 Blue = 1,
                 Hex = "#FFFFFF")
    } else {
      isolate({
        color_extractor(url_png = input$input_image_url,
                        colors  = input$input_color_n)[["colors"]] 
      })
    }
  }, options = list(autoWidth = TRUE,
                    scrollX   = TRUE,
                    scrollCollapse = TRUE))
}
