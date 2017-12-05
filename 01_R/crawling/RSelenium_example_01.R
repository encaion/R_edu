#### example for windows(local) ####
# using phantom browser
port_no = sample(2000:8000, size = 1)

library("wdman")
chrome(port = port_no)
phantomjs(port = port_no)
selenium(port = port_no)

library("RSelenium")
dd = rsDriver(port = port_no, browser = "phantomjs")
dd_client = dd$client
dd_client$navigate("http://www.google.com")
dd_client$navigate("https://www.naver.com")
dd_client$goBack()
dd_client$getCurrentUrl()[[1]]
dd_client$getPageSource()
