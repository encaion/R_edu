library("RCurl")
url = "https://~~~"
xx = getURL(url, nobody=1L, header=1L)
xx_split = strsplit(xx, "\r\n")
as.numeric(gsub("[^0-9]", "", xx_split[[1]][7])) # file size(Byte)
