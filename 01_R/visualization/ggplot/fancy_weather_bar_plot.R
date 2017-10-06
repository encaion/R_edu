#################################################################
# 예제 페이지 - http://rpubs.com/bradleyboehmke/weather_graphic #
#################################################################
# 자료- http://academic.udayton.edu/kissock/http/Weather #
########################################################## 

require("RCurl")
DAY = read.table( textConnection(getURL("http://academic.udayton.edu/kissock/http/Weather/gsod95-current/KOSEOUL.txt")), header = FALSE)
# write.csv(DAY, "R_tips_weather_barplot.csv", row.names = FALSE)
# DAY = read.csv("R_tips_weather_barplot.csv", header = TRUE)
head(DAY)

# 변수명 재정의
names(DAY) <- c("Month", "Day", "Year", "Temp")
head(DAY)

table(DAY$Year) # 2015년도 까지 있음.
DAY = DAY[ DAY$Year <= 2014, ] # 2014년도 까지만 사용
year_data_frame = as.data.frame(table(DAY$Year))
head(year_data_frame)
sapply(year_data_frame, class)

# 이상치 제거
summary(DAY)
DAY = DAY[ DAY$Temp != -99, ]

# (화씨온도 - 32) / 1.8 = 섭씨온도
DAY[, "Temp"] = (DAY[, "Temp"] - 32)/1.8
head(DAY)

# 년평균온도 산출
yearly_temp = aggregate(DAY$Temp, by = list(DAY$Year), FUN = "mean")
colnames(yearly_temp) = c("Year", "Temp_mean")
head(yearly_temp)

# 덥고 춥고 순위 ㅋ
yearly_temp = yearly_temp[ order(yearly_temp$Temp_mean), ]
yearly_temp[, "hot_rank"] = c(nrow(yearly_temp):1) # 더운 순위
yearly_temp[, "cool_rank"] = c(1:nrow(yearly_temp)) # 추운 순위
head(yearly_temp)

# 전체 기간 평균
entire_temp_mean = round(mean(DAY$Temp),1)


filter_year = 2014 # 최종 선그래프로 표출할 연도 지정.
years = as.numeric( as.character(year_data_frame$Var1))
years = years[ years != filter_year ]
start_year = years[1] # 시작년도
end_year = years[ length(years) ]# 종료년도
year_diff = end_year - start_year


# 데이터 전처리 및 요약
library("dplyr")
library("tidyr")

# 데이터 시각화
library("ggplot2")

# start_year 부터 end_year 데이터를 'Past'객체에 저장
Past <- DAY %>%
  group_by(Year, Month) %>%
  arrange(Day) %>%
  ungroup() %>%
  group_by(Year) %>%
  mutate(newDay = seq(1, length(Day))) %>%   # 객체 'DAY'는 group_by()로 묶여 있음 nrow(DAY) == 365 (x축으로 들어감)         
  ungroup() %>%
  filter(Temp != -99 & Year != filter_year) %>%     # 이상치인 '-99'값과 표출할 값인 filter_year년도 데이터를 필터링
  group_by(newDay) %>%
  mutate(upper = max(Temp), # 일 최대값 식별
         lower = min(Temp), # 일 최소값 식별
         avg = mean(Temp),  # 일 평균값 계산
         se = sd(Temp)/sqrt(length(Temp))) %>%  # 표준편차 계산
  mutate(avg_upper = avg+(2.101*se),  # 평균값의 95% 신뢰구간 계산
         avg_lower = avg-(2.101*se)) %>%  # 평균값의 95% 신뢰구간 계산
  ungroup()

# 표출하고자 하는 연도의 값을 'Present' 객체에 넣는다.
Present <- DAY %>%
  group_by(Year, Month) %>%
  arrange(Day) %>%
  ungroup() %>%
  group_by(Year) %>%
  mutate(newDay = seq(1, length(Day))) %>%  # 'Past' 경우와 같이 x축에 맞는 기준 데이터(1:365)를 만든다.
  ungroup() %>%
  filter(Temp != -99 & Year == filter_year)  # 결측치('-99')제거 및 filter_year 이외 데이터 추출
# head(Present)

# 과거 데이터를 보았을 때 가장 낮은 일 데이터를 추출하여 'PastLows'객체에 저장
PastLows <- Past %>%
  group_by(newDay) %>%
  summarise(Pastlow = min(Temp)) # start_year 부터 filter_year를 제외한 end_year 까지 가장 온도가 가장 낮은 날을 식별
# head(PastLows)

# filter_year의 데이터 중 과거 year_diff 동안 온도가 가장 낮았던 것 보다 더 낮은 온도를 기록한 날을 식별
PresentLows <- Present %>%
  left_join(PastLows) %>%  # merge historical lows to current year low data
  mutate(record = ifelse(Temp<Pastlow, "Y", "N")) %>% # filter_year의 데이터가 기존 것 보다 더 낮다면 "Y"
  filter(record == "Y")  # "Y"만 필터링
# head(PresentLows)
cool_days = nrow(PresentLows)

# 과거 데이터를 보았을 때 가장 높은 일 데이터를 추출하여 'PastHighs'객체에 저장
PastHighs <- Past %>%
  group_by(newDay) %>%
  summarise(Pasthigh = max(Temp))  # start_year에서 end_year 사이에 온도가 가장 높았던 날을 식별

# filter_year 년의 데이터 중 과거 year_diff년 동안 온도가 가장 높았던 것 보다 더 높은 온도를 기록한 날을 식별
PresentHighs <- Present %>%
  left_join(PastHighs) %>%  # present와 pastHighs를 left_join
  mutate(record = ifelse(Temp>Pasthigh, "Y", "N")) %>% # filter_year년도의 데이터가 기존 것 보다 더 낮다면 "Y"
  filter(record == "Y")  # "Y"만 필터링
# head(PresentHighs)
hot_days = nrow(PresentHighs)

# y축 라벨 생성용 함수
dgr_fmt <- function(x, ...) {
  parse(text = paste(x, "~degree*C", sep = "")) # 섭씨 표기
}

# y축 라벨 벡터 생성
a <- dgr_fmt(seq(-30,50, by=10))

# 그래프 중간에 작게 꺾은선 그릴때 필요한 객체 ㅇㅇ.
legend_data <- data.frame(x=seq(175,182),y=rnorm(8,-5,2)) 

# rm(p)

# 배경색 / 전경색
colors = c("#E5DFB0", "#72BF9F")

# Step_1
# 넓은 막대
p <- ggplot(Past, aes(newDay, Temp)) +
  theme(plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.ticks = element_blank(),
        #axis.text = element_blank(),  
        axis.title = element_blank()) +
  geom_linerange(Past, mapping=aes(x=newDay, ymin=lower, ymax=upper), colour = colors[1], alpha=0.1) # wheat2
# print(p)

# Step_2
# 좁은 막대
p <- p + 
  geom_linerange(Past, mapping=aes(x=newDay, ymin=avg_lower, ymax=avg_upper), colour = colors[2]) # wheat4
# print(p)

# Step_3
# 꺾은선 그래프를 그리고, 왼쪽 y축(xintercept = 0)에 세로선을 긋는다.
# 색과 타입은 파라미터 설정 참조.
p <- p + 
  geom_line(Present, mapping=aes(x=newDay, y=Temp, group=1)) +
  geom_vline(xintercept = 0, colour = colors[2], linetype=1, size=1)
# print(p)

# Step_4
# yintercept 값에 따른 가로선을 긋는다. 색과 타입은 파라미터 참조.
p <- p + 
  geom_hline(yintercept = -30, colour = "white", linetype=1) +
  geom_hline(yintercept = -20, colour = "white", linetype=1) +
  geom_hline(yintercept = -10, colour = "white", linetype=1) +
  geom_hline(yintercept = 0, colour = "white", linetype=1) +
  geom_hline(yintercept = 10, colour = "white", linetype=1) +
  geom_hline(yintercept = 20, colour = "white", linetype=1) +
  geom_hline(yintercept = 30, colour = "white", linetype=1) +
  geom_hline(yintercept = 40, colour = "white", linetype=1) +
  geom_hline(yintercept = 50, colour = "white", linetype=1) 
# print(p)

# Step_5
# xintercept 값에 따른 세로점선(geom_vline, linetype = 3)을 긋는다. 이때 선은 월별 일수 기준. 
p <- p + 
  geom_vline(xintercept = 31, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 59, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 90, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 120, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 151, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 181, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 212, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 243, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 273, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 304, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 334, colour = "wheat4", linetype=3, size=.5) +
  geom_vline(xintercept = 365, colour = "wheat4", linetype=3, size=.5) 
# print(p)

# Step_6
# x축과 y축 라벨을 붙임
p <- p +
  coord_cartesian(ylim = c(-30,50)) +
  scale_y_continuous(breaks = seq(-30,50, by=10), labels = a) +
  scale_x_continuous(expand = c(0, 0),
                     breaks = c(15,45,75,105,135,165,195,228,258,288,320,350),
                     labels = c("1월", "2월", "3월", "4월",
                                "5월", "6월", "7월", "8월", "9월",
                                "10월", "11월", "12월"))
# print(p)

# Step_7
# Present(Low/High)s 데이터를 찍는다.
point_size = 3
p <- p +
  geom_point(data=PresentLows, aes(x=newDay, y=Temp), colour="blue3", size = point_size) +
  geom_point(data=PresentHighs, aes(x=newDay, y=Temp), colour="firebrick3", size = point_size)

# print(p)

# Step_8
# 그래프 제목 및 소제목 설정
# 소제목의 위치는 택스트 중앙점이 기준점이기 때문에 글자수 변경시 재조정 필요
p <- p +
  ggtitle( paste0("Gang-Nam's Weather in ", 2015) )+
  theme(plot.title=element_text(face="bold",hjust=.012,vjust=.8,colour="#3C3C3C",size=20)) +
  annotate("text", x = 28, y = 49, label = "Temperature (ºC)", size=4, fontface="bold")

# print(p)

# Step_9
# annotate글자 수가 바뀔 때 마다 x를 재설정 해줘야 되서 귀찮음.
head(yearly_temp)
filter_hot_rank = yearly_temp[ yearly_temp$Year == filter_year, "hot_rank"]
filter_cool_rank = yearly_temp[ yearly_temp$Year == filter_year, "cool_rank"]

# print(p)

# Step_10
# 파랑/빨강 점에 선긋고 annotate 남기기. 위치조정 노가다.
# hot_days, cool_days
# 이상치 지점들 데이터 끌어올 것.

High_point = (PresentHighs[ (PresentHighs$newDay > 230) & (PresentHighs$newDay < 310), c("newDay", "Temp")])[1, ]
Low_point = (PresentLows[ (PresentLows$newDay > 60) & (PresentLows$newDay < 180), c("newDay", "Temp")])[1, ]

p <- p +
  annotate("segment", x = as.numeric(Low_point[1]), xend = 80, y = as.numeric(Low_point[2]), yend = -20, colour = "blue3") + # 직선 그리기
  annotate("text", x = 78, y = -22, label = paste0("We had ", cool_days," days that were the"), size=3, colour="blue3") +
  annotate("text", x = 66, y = -25, label = paste0("coldest since ",start_year), size=3, colour="blue3") +
  annotate("segment", x = as.numeric(High_point[1]), xend = 307, y = as.numeric(High_point[2]), yend = 40, colour = "firebrick3") + # 직선 그리기
  annotate("text", x = 332, y = 44, label = paste0("We had ", hot_days," days that were the"), size=3, colour="firebrick3") +
  annotate("text", x = 320, y = 41, label = paste0("hottest since ", start_year), size=3, colour="firebrick3")

# print(p)

# Step_11
# 가운데 범례 비슷하게 만들기
p <- p +
  annotate("segment", x = 181, xend = 181, y = -15, yend = 5, colour = colors[1], size=3) +
  annotate("segment", x = 181, xend = 181, y = -8, yend = -2, colour = colors[2], size=3) +
  geom_line(data=legend_data, aes(x=x,y=y)) +
  annotate("segment", x = 183, xend = 185, y = -2.3, yend = -2.3, colour = colors[2], size=.5) +
  annotate("segment", x = 183, xend = 185, y = -7.8, yend = -7.8, colour = colors[2], size=.5) +
  annotate("segment", x = 185, xend = 185, y = -7.8, yend = -2.3, colour = colors[2], size=.5) +
  annotate("text", x = 208, y = -5, label = "NORMAL RANGE", size=4, colour="gray30") +
  annotate("text", x = 145, y = -5.25, label = paste0(2015, " TEMPERATURE"), size=4, colour="gray30") +
  annotate("text", x = 203, y = 4, label = "RECORD HIGH", size=4, colour="gray30") +
  annotate("text", x = 203, y = -14, label = "RECORD LOW", size=4, colour="gray30")

print(p) # 812x423 최적화.
