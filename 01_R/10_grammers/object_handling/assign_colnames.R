df = data.frame(aa = 1:10,
                bb = 10:1,
                cc = letters[1:10])
df_1 = df
df_2 = df
df_3 = df
df_4 = df

head(df)
#   aa bb cc
# 1  1 10  a
# 2  2  9  b
# 3  3  8  c
# 4  4  7  d
# 5  5  6  e
# 6  6  5  f

list_df = ls(pattern = "df")
list_df
# [1] "df"   "df_1" "df_2" "df_3" "df_4"

for(n in 1:length(list_df)){
  sub = get(list_df[n])
  colnames(sub) = c("V_1", "V_2", "V_3")
  assign(value = sub, x = list_df[n])
}
head(df_4)
#   V_1 V_2 V_3
# 1   1  10   a
# 2   2   9   b
# 3   3   8   c
# 4   4   7   d
# 5   5   6   e
# 6   6   5   f
