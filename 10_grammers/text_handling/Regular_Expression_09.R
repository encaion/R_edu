text = c("123abb233 123 dds1",
         "answer2 table3")
gsub(pattern = "\\<[a-z]", replacement = "", x = text)
gsub(pattern = "[0-9]{1,}\\>", replacement = "", x = text)


gsub(pattern = "(?<=abb)", replacement = "", x = text, perl = TRUE)
