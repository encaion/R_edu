#### example for windows(local) ####
# using phantom browser
port_no = sample(2000:8000, size = 1)

library("RSelenium")
dd = rsDriver(port = port_no, browser = "phantomjs")
dd_client = dd$client

dd_client$setImplicitWaitTimeout(milliseconds = 3000) # 모든 자원 로드를 위해 설정하는 옵션
dd_client$navigate("http://www.google.com")
dd_client$navigate("https://www.naver.com")
dd_client$goBack()
dd_client$getCurrentUrl()[[1]]
dd_client$getPageSource()
