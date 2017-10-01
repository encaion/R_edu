text = readLines("http://www.naver.com")
Encoding(text) = "UTF-8"
text_sub = grep(pattern = "ah_k", text, value = TRUE)[1:20]
for(n in 1:length(text_sub)){
  start_p = gregexpr(text_sub[n], pattern = ">")[[1]][1] + 1
  end_p   = gregexpr(text_sub[n], pattern = "<")[[1]][2] - 1
  text_sub[n] = substr(text_sub[n], start_p, end_p)
}
text_sub
