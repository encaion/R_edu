gsub(pattern = "<.*?>", replacement = "", grep(pattern = "ah_k", readLines("https://www.naver.com", encoding = "UTF-8"), value = TRUE)[1:20])
