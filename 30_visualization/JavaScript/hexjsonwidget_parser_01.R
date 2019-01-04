library("jsonlite")
library("htmlwidgets")
library("hexjsonwidget")

df = data.frame(value = paste0(letters[sample(1:26, size = 10)],
                               letters[sample(1:26, size = 10)],
                               letters[sample(1:26, size = 10)]),
                q = sample(1:10, size = 10, replace = FALSE),
                r = sample(1:10, size = 10, replace = FALSE),
                stringsAsFactors = FALSE)

conv4HexJSON = function(data, column_q, column_r, column_value){
  ls = list(layout = "odd-r",
            hexes = rep(list(list(q = 1, r = 1)), nrow(data)))
  names(ls$hexes) = data[, column_value]  
  
  for(n in 1:nrow(data)){
    ls$hexes[[n]]$q = data[n, column_q]
    ls$hexes[[n]]$r = data[n, column_r]
  }
  
  return(fromJSON(toJSON(ls)))
}

json_data = conv4HexJSON(data = df, column_q = 2, column_r = 3, column_value = 1)

hexjsonwidget(jsondata = json_data, 
              col_hexfill = "#FFE500", 
              col_gridfill = "#123123", 
              col_textfill = "#FF0000",
              grid = "on")
