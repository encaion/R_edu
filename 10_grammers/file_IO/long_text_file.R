# text file with annoying form
# should delete blank and duplicated column name lines

library("data.table")
library("splitstackshape")
txt = fread("long_text_sample.csv", sep = NULL, col.names = "col")
txt = txt[grep(pattern = "^[0-9]", txt$col), ]
txt = cSplit(indt = txt, splitCols = "col", sep = " ")
head(txt)
