options(stringsAsFactors = FALSE)
library("highcharter")
name = c("Animals", "Fruits", "Cars")
df = data.frame(name = name,
                y = c(5, 2, 4),
                drilldown = tolower(name))

ds = list_parse(df)

hc = highchart() %>%
  hc_chart(type = "column") %>%
  hc_title(text = "Basic drilldown") %>%
  hc_xAxis(type = "category") %>%
  hc_legend(enabled = FALSE) %>%
  hc_plotOptions(series = list(boderWidth = 0,
                               dataLabels = list(enabled = TRUE))) %>%
  hc_add_series(name = "Things",
                colorByPoint = TRUE,
                data = ds)

dfani = data.frame(name = c("Cats", "Dogs", "Cows", "Sheep", "Pigs"),
                   value = c(4, 3, 1, 2, 1))

dffru = data.frame(name = c("Apple", "Organes"),
                   value = c(4, 2))

dfcar = data.frame(name = c("Toyota", "Opel", "Volkswage"),
                   value = c(4, 2, 2))

hc %>%
  hc_drilldown(allowPointDrilldown = TRUE,
               series = list(list(id = "animals", data = list_parse2(dfani)),
                             list(id = "fruits",  data = list_parse2(dffru)),
                             list(id = "cars",    data = list_parse2(dfcar))))
