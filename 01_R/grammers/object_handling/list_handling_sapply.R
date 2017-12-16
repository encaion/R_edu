time_series = seq(as.POSIXct("2017-01-01"), as.POSIXct("2017-05-01"), by = "day")

set.seed(123)
list_1 = list(a = sample(time_series, size = 5),
              b = sample(time_series, size = 5),
              c = sample(time_series, size = 5))
list_1
# $a
# [1] "2017-02-04 KST" "2017-04-05 KST" "2017-02-18 KST" "2017-04-15 KST" "2017-04-21 KST"
# 
# $b
# [1] "2017-01-06 KST" "2017-03-05 KST" "2017-04-17 KST" "2017-03-07 KST" "2017-02-23 KST"
# 
# $c
# [1] "2017-04-26 KST" "2017-02-24 KST" "2017-03-22 KST" "2017-03-09 KST" "2017-01-13 KST"

as.POSIXct(sapply(list_1, "[[", 1), origin = "1970-01-01")
#                a                b                c 
# "2017-02-04 KST" "2017-01-06 KST" "2017-04-26 KST" 

# 리스트의 첫 번째 원소를 일괄 추출하는 방법
sapply(list_obj, "[[", 1)
