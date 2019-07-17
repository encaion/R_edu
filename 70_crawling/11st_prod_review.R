library("RSelenium")
library("rvest")
library("xml2")

drv_version = binman::list_versions("chromedriver")[[1]]
drv = rsDriver(port = sample(3000L:5000L, size = 1), browser = "chrome", 
               chromever = drv_version[length(drv_version)-4])
cl = drv$client

url = "http://www.11st.co.kr/product/SellerProductDetail.tmall?method=getSellerProductDetail&prdNo=2183877772&trTypeCd=PW24&trCtgrNo=585021&lCtgrNo=1001372&mCtgrNo=1002268"
cl$navigate(url)

text_main = cl$getPageSource()
text_main = read_html(text_main[[1]])

text_main %>%
  html_node(xpath = '//*[@id="ifrmReview"]') %>%
  html_attr("src") -> iframe_url

# cl$switchToFrame(Id = iframe_name)
cl$navigate(paste0("http://www.11st.co.kr", iframe_url))

text_review = cl$getPageSource()
text_review = read_html(text_review[[1]])

text_review %>%
  html_nodes(xpath = "/html/body/div/div[3]/ul/li[1]/div/div[2]/div/p[2]/span/span")
