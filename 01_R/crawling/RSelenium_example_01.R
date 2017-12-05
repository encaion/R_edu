#### example for windows(local) ####
port_no = sample(2000:8000, size = 1)

library("wdman")
gecko(port = port_no, check = TRUE, verbose = TRUE)
chrome(port = port_no, check = TRUE, verbose = TRUE)
iedriver(port = port_no, check = TRUE, verbose = TRUE)
phantomjs(port = port_no, check = TRUE, verbose = TRUE)
selenium(port = port_no, check = TRUE, verbose = TRUE)

library("RSelenium")
dd = rsDriver(port = port_no, browser = "phantomjs")
# dd = rsDriver(port = port_no, browser = "chrome")
dd_client = dd$client
# dd_client$getSession()
# dd$client$closeall()

dd_client$navigate("http://www.google.com")
dd_client$navigate("https://www.google.co.kr/search?q=%EC%B6%94%EC%B2%9C&rlz=1C1CHZL_koKR761KR761&oq=%EC%B6%94%EC%B2%9C&aqs=chrome..69i57j0l5.1867j0j8&sourceid=chrome&ie=UTF-8")
dd_client$goBack()
dd_client$getCurrentUrl()[[1]]
dd_client$getPageSource()
