# rbind에서 column이름이 다를 경우 무시하고 넣는 방법
# rbind( df , setNames( rev(df) , names( df ) ) )

df1 = data.frame(id = 1:3,
                 A  = letters[1:3])
df2 = data.frame(id = 4:6,
                 A  = letters[4:6])
df3 = data.frame(id = 7:9,
                 A  = letters[7:9])

# 여러개의 객체를 rbind로 묶는 방법 
do.call("rbind", list(df1, df2, df3))

# 데이터 객체가 텍스트로 있을 경우
df_list = ls(pattern = "df")
do.call(rbind, lapply(df_list, "get"))

# 하나의 데이터프레임 객체를 원하는 개수 만큼 복제하고자 할 때
df_binded = do.call(rbind, lapply(rep("df", 10), "get"))
