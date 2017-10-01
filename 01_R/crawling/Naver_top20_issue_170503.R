text = readLines("http://www.naver.com")
Encoding(text) = "UTF-8"
gsub(pattern = "<.*?>", replacement = "", grep(pattern = "ah_k", text, value = TRUE)[1:20])
