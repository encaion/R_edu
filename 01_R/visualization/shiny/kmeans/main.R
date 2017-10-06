library("shiny")
library("ggplot2")

ui = fluidPage(
  headerPanel("붓꽃 데이터 군집 분석"),
  sidebarPanel(selectInput(inputId  = "xcol", 
                           label    = "X 변수",
                           choices  = names(iris),
                           selected = names(iris)[[1]]),
               selectInput(inputId  = "ycol",
                           label    = "Y 변수",
                           choices  = names(iris),
                           selected = names(iris)[[2]]),
               numericInput(inputId = "clusters",
                            label   = "군집 개수", 
                            value   = 3, 
                            min     = 1, 
                            max     = 9)),
  mainPanel(plotOutput(outputId = "plot"))
)

server = function(input, output) {
  
  selectedData = reactive(iris[, c(input$xcol, input$ycol)])
  
  clusters = reactive({
    kmeans(selectedData(), input$clusters)
  })

  cluster_centroids = reactive({
    as.data.frame(kmeans(selectedData(), input$clusters)$centers)
  })
  
  output$plot = renderPlot({
    ggplot() + 
      geom_point(data = selectedData(),
                 aes(x = selectedData()[, 1],
                     y = selectedData()[, 2],
                     color = as.factor(clusters()$cluster)),
                 size = 3) + 
      geom_point(data = cluster_centroids(),
                 aes(x = cluster_centroids()[, 1],
                     y = cluster_centroids()[, 2]),
                 color = "#000000",
                 size = 5,
                 shape = 4) + 
      scale_color_discrete("Clusters") + 
      labs(x = input$xcol,
           y = input$ycol) + 
      theme(axis.text = element_text(size = 14),
            axis.title = element_text(size = 20),
            legend.title = element_text(size = 20),
            legend.text = element_text(size = 14))
  })
  
}

shinyApp(ui = ui, server = server)
