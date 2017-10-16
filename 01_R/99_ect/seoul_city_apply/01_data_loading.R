commute = fread("seoul_commute.csv", data.table = FALSE)
colnames(commute) = c("year", "cat_1", "cat_2", paste0("time_", 1:5), "time_mean")
head(commute)



#### 서울시 데이터 다운로드 ####
 #
key = "774b707659656e6331303264646b4f41"
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


df = fread("201701.txt", data.table = FALSE)
head(df, 2)
summary(df)


#### 지도데이터 ####
# install.packages("ggmap")
# install.packages("maptools")
library("ggplot2")
library("ggmap")
library("sp")
library("maptools")

korea_map_shp = readShapePoly("WGS84_SIGOONGU_2013.shp")
korea_map = fortify(korea_map_shp)
head(korea_map)
unique(korea_map$id)
sapply(korea_map, "class")

# 전국지도 그리기
ggplot(data = korea_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(fill = "#FFFFFF",
               color = "#000000")

korea_map[, "id"] = as.numeric(korea_map[, "id"])
seoul_map = korea_map[korea_map$id <= 24, ]
head(seoul_map)

ggplot(data = seoul_map,
       aes(x = long,
           y = lat,
           group = group)) + 
  geom_polygon(fill = "#FFFFFF",
               color = "#000000")

# fwrite(seoul_map, "seoul_map.csv")

# 시군구 정보 추출
kr_name_df = data.frame(cd = as.character(korea_map_shp$sigungu_cd),
                        name_kr = as.character(korea_map_shp$sigungu_nm),
                        stringsAsFactors = FALSE)
head(kr_name_df, 30)
nrow(kr_name_df) # 251

kr_name_df = kr_name_df[1:25, ] # 서울만 추출
kr_name_df[, "id"] = (1:nrow(kr_name_df)) - 1
head(kr_name_df)

# fwrite(kr_name_df, "seoul_sigungu_df.csv")

# 시군구 정보에 추가 정보 매핑 필요
# 추가 데이터 가져오기

#### 서울시 통계 데이터 확인 ####
# 교통량
df_traffic = fread("traffic_velocity_2016.csv", data.table = FALSE)
head(df_traffic)

colnames(df_traffic) = c("year", "name_kr", paste0("m_", 1:12))
head(df_traffic)

# fwrite(df_traffic, "traffic_velocity_2016_modified.csv")

# 행정구역별 사업체 및 근로자 수 현황(2015)
df = fread("seoul_companies_emp_count.csv", data.table = FALSE)
df = df[-1, c(1:2, 4:5)]
colnames(df) = c("year", "name_kr", "count_corp", "count_emp")
head(df)


