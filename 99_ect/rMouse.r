# install.packages("rMouse")
library("rMouse")

left_m = function(x, y, delay = 0.2){
  for(n in 1:8){ # unstable
    move(x, y)
  }
  Sys.sleep(delay)
  left()
  Sys.sleep(delay)
}

# 1280, 720
coord()

download_wos = function(value1 = 1, value2 = 100){
  # 메뉴 클릭
  left_m(570, 325)
  # record 라디오 버튼 클릭
  left_m(213, 305)
  # from 이동
  left_m(290, 305)
  # 시작값 입력
  type(string = value1)
  # to 이동
  left_m(390, 305)
  # 종료값 입력
  type(string = value2)
  # 컨텐츠 선택
  left_m(390, 400)
  left_m(390, 530)
  left_m(300, 440)
  
  Sys.sleep(5)
  left_m(357, 387)
}

df = data.frame(v1 = seq(0, 48200 - 500, by = 500),
                v2 = seq(499, 48200, by = 500))
df[1, 1] = 1
df[97, ] = c(48000, 48200)
head(df)
tail(df)

for(n in 12:nrow(df)){
  # n = 1
  print(n)
  download_wos(value1 = df[n, 1],
               value2 = df[n, 2])
  Sys.sleep(2)
}

