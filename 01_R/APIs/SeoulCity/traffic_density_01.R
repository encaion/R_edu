#### 서울시 데이터 다운로드 ####
# 서울시 교통량 이력 정보
# https://data.seoul.go.kr/openinf/openapiview.jsp?infId=OA-13316&tMenu=11&#detailInfo

key = ""
url = paste0("http://openapi.seoul.go.kr:8088/",
             key,
             "/xml/VolInfo/1/5/A-01/20160301/12")

dd = readLines(url, encoding = "UTF-8")
head(dd)

library("XML")
dd = xmlToList(dd)

df_dd = data.frame()
for(n in 1:as.numeric(dd$list_total_count)){
  # n = 1
  df_dd = rbind(df_dd, unlist(dd[[n + 2]]))
  if(n == 1){
    colnames(df_dd) = names(dd[[n + 2]])
    for(n_col in 1:ncol(df_dd)){
      df_dd[, n_col] = as.character(df_dd[, n_col])
    }
  }
}
df_dd

#   spot_num      ymd hh io_type lane_num vol
# 1     A-01 20160301 12       1        1 807
# 2     A-01 20160301 12       1        2 972
# 3     A-01 20160301 12       2        3 796
# 4     A-01 20160301 12       2        4 711
