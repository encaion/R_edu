#### Packages ####
library("jsonlite")
library("rvest")

#### values ####
Sys.setenv(cx = "unique_app_id",
           API_key = "API_key")

#### Code ####
url_base = "https://www.googleapis.com/customsearch/v1?key="

url = paste0(url_base, Sys.getenv("API_key"),
             "&cx=", Sys.getenv("cx"),
             "&q=", URLencode(utf8::utf8_encode("딸기")))

text = read_json(url, encoding = "UTF-8")
text
