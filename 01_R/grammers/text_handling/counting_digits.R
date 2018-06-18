# counting digits under the decimal point

nchar(gsub(pattern = "^.*?(\\.|$)", replacement = "", x = 123))
nchar(gsub(pattern = "^.*?(\\.|$)", replacement = "", x = 123.1))
nchar(gsub(pattern = "^.*?(\\.|$)", replacement = "", x = 123.12))
nchar(gsub(pattern = "^.*?(\\.|$)", replacement = "", x = 123.123))
