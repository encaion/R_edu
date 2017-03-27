# UI
library("shiny")
library("ggplot2")

ui = fluidPage(h1("Color Picker for png File Extension"),
               br(),
               fluidRow(style = "background-color: #DDDDDD; margin: 0px; padding: 8px;",
                        column(width = 4, # 주소 입력받는 구역
                               div(width = "100%",
                                   textInput(inputId = "input_image_url",
                                             width = "100%",
                                             label = "Type png image file URL",
                                             value = "http://img2.wikia.nocookie.net/__cb20120621203534/mario/es/images/e/ee/Mario_Mapache_en_New_Super_Mario_Bros._2.png"))),
                        column(width = 1,
                               div(width = "100%",
                                   numericInput(inputId = "input_color_n", 
                                                width = "100%",
                                                label = "Colors",
                                                value = 3))),
                        column(width = 1, # summit 버튼
                               div(width = "100%",
                                   actionButton(inputId = "summit", 
                                                width = "100%",
                                                label = "Summit",
                                                style = "padding-top: 20px; padding-bottom: 20px; font-size: 100%"))),
                        column(width = 6)),
               br(),
               fluidRow(column(width = 6,
                               div(width = "100%",
                                   style = "background-color: #CDE9FA; margin: 0px; padding: 8px;",
                                   imageOutput(outputId = "plot_01"))),
                        column(width = 6,
                               div(width = "100%",
                                   style = "background-color: #FFAACC; margin: 0px; padding: 8px;",
                                   plotOutput(outputId = "plot_02")))),
               br(),
               h3("Picked Colors"),
               column(width = 12,
                      dataTableOutput(outputId = "DT")))

