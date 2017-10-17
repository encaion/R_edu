#### Data Join ####
kr_name_df = fread("seoul_sigungu_df.csv", data.table = FALSE)

# 행정구역별 각종 정보 가져오기
df_corp_emp = fread("seoul_corp_emp_count_2015.csv", data.table = FALSE)
df_corp_emp[, "ratio"] = round(df_corp_emp$count_emp / df_corp_emp$count_corp, 2)
head(df_corp_emp)

# 통계청 인구 정보 가져오기
df_pop = fread("seoul_population_2015_modified.csv", data.table = FALSE)
head(df_pop)

# 출퇴근 시간 관련 정보 가져오기
df_commute = fread("seoul_commute_2016_modified.csv", data.table = FALSE)
head(df_commute)

# 주차장 확보 관련 정보 가져오기
df_park = fread("parkinglot_rate_2016.csv", data.table = FALSE)
df_park = df_park[c(-1, -nrow(df_park)), ]
colnames(df_park) = c("year", "name_kr", "car_reg", "car_area", "park_ratio")

for(n in 3:5){
  df_park[, n] = as.numeric(gsub(pattern = ",", replacement = "", x = df_park[, n]))
}
head(df_park)

df_commute$time_mean

kr_name_df_join = left_join(kr_name_df, df_corp_emp[, -1],
                            by = c("name_kr" = "name_kr"))
kr_name_df_join = left_join(kr_name_df_join, df_pop[, -1],
                            by = c("name_kr" = "name_kr"))
kr_name_df_join = left_join(kr_name_df_join, df_commute[, -1],
                            by = c("name_kr" = "name_kr"))
kr_name_df_join = left_join(kr_name_df_join, df_park[, -1],
                            by = c("name_kr" = "name_kr"))
head(kr_name_df_join)

kr_name_df_join[, "emp_pop_ratio"] = round(kr_name_df_join$count_emp / kr_name_df_join$population, 2)
head(kr_name_df_join)

# fwrite(kr_name_df_join, "seoul_stats_171016_16.csv")

# 지도 관련 
kr_name_df_join = fread("seoul_stats_171016_16.csv", data.table = FALSE)
Encoding(kr_name_df_join$name_kr) = "UTF-8"
head(kr_name_df_join)

seoul_map = fread("seoul_map.csv", data.table = FALSE)
seoul_map = left_join(seoul_map, kr_name_df_join[, -1], by = c("id" = "id"))
head(seoul_map)

fwrite(seoul_map, "seoul_map_stat_join_171016_16.csv")
