library("stringi")

url = "http://dart.fss.or.kr/dsaf001/main.do?rcpNo=20160516003174"
doc = read_html(url, encoding = "UTF-8")
doc %>% 
  html_nodes(xpath = "//*/li/a[@href='#download']") %>% 
  html_attr("onclick") %>% 
  stri_extract(regex = ", \'[0-9]{6,8}\'") %>% 
  gsub(pattern = "[^0-9]", replacement = "") -> dcm_no
