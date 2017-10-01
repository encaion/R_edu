library("devtools")
# install_github("psychemedia/htmlwidget-hexjson")
# install.packages("jsonlite")
# install.packages("htmlwidgets")

library("jsonlite")
library("htmlwidgets")
library("hexjsonwidget")

json_text = '{
	"layout":"odd-r",
	"hexes":{
		"C0R0":{"q":0,"r":0},
		"C1R0":{"q":1,"r":0},
		"C2R0":{"q":2,"r":0},
		"C3R0":{"q":3,"r":0},
		"C0R1":{"q":0,"r":1},
		"C1R1":{"q":1,"r":1},
		"C2R1":{"q":2,"r":1},
		"C3R1":{"q":3,"r":1},
		"C0R2":{"q":0,"r":2},
		"C1R2":{"q":1,"r":2},
		"C2R2":{"q":2,"r":2},
		"C3R2":{"q":3,"r":2},
		"C0R3":{"q":0,"r":3},
		"C1R3":{"q":1,"r":3},
		"C2R3":{"q":2,"r":3, "textCol":"#000000"},
		"C3R3":{"q":3,"r":3, "col":"#FFAACC"},
    "ssss":{"q":10,"r":10}
	}
}'

obj_json = fromJSON(json_text)
hexjsonwidget(jsondata = obj_json, 
              col_hexfill = "#FFE500", 
              col_gridfill = "#123123", 
              col_textfill = "#FF0000",
              grid = "on")
