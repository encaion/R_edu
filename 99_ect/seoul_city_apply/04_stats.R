seoul_stat = fread("seoul_stats_171016_16.csv", data.table = FALSE)
Encoding(seoul_stat$name_kr) = "UTF-8"
head(seoul_stat)

colnames(seoul_stat)

seoul_stat[, "corp_pop"] = round(seoul_stat$count_corp / seoul_stat$population, 2)
seoul_stat[, "emp_pop" ] = round(seoul_stat$count_emp  / seoul_stat$population, 2)
seoul_stat[, "car_reg_pop" ] = round(seoul_stat$car_reg   / seoul_stat$population, 2)
seoul_stat[, "area_pop" ]    = round(seoul_stat$car_area  / seoul_stat$population, 2)
head(seoul_stat)

summary(seoul_stat)

# 결측 제거
for(n in 5:16){
  seoul_stat[seoul_stat[, n] == "-", n] = 0
}
head(seoul_stat, 2)

# 특정 column 추출
t(t(colnames(seoul_stat)))
stat = seoul_stat[, c(6:13, 16:21)]
head(stat)

#### 상관분석 ####
sapply(stat, "class")
for(n in 1:ncol(stat)){
  stat[, n] = as.numeric(stat[, n])
}
stat_corr = cor(stat)
corrplot(stat_corr, hclust.method = "ward")
