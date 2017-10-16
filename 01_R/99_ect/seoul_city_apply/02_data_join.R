#### Data Join ####
seoul_map = fread("seoul_map.csv", data.table = FALSE)
kr_name_df = fread("seoul_sigungu_df.csv", data.table = FALSE)

# 행정구역별 각종 정보 가져오기



seoul_map = left_join(seoul_map, kr_name_df[, -1], by = c("id" = "id"))
head(seoul_map)
