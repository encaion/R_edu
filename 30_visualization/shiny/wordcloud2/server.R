# server
library("shiny")
library("wordcloud2")
library("rhandsontable")
library("NISTunits")

server = function(input, output){
  data = reactiveValues(sample = data.frame(words = c("사과", "딸기", "아보카도", "포도", "바나나", "귤"),
                                            count = (10:15) * 5,
                                            stringsAsFactors = FALSE))

  switches = reactiveValues(plotting = 0)
  
  observeEvent(input$summit, {
    switches$plotting = input$summit
  })  
  
  output$wordcloud = renderWordcloud2({
    if(switches$plotting == FALSE){
      wordcloud2(data$sample)
    } else { 
      isolate({
        wordcloud2(data = read.csv(input$file$datapath),           
                   minSize = input$slider_text_min,
                   rotateRatio = input$slider_rotate,
                   minRotation = NISTdegTOradian(input$slider_rotate_min), 
                   maxRotation = NISTdegTOradian(input$slider_rotate_max))
      })
    }
  })
  
  output$table = renderRHandsontable({
    if(switches$plotting == FALSE){
      rhandsontable(t(data$sample),
                    width = "100%")
    } else { 
      isolate({
        rhandsontable(t(read.csv(input$file$datapath)),
                      width = "100%")  
      })
    }
  })
}
