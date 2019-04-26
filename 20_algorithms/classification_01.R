# 환자의 치료주기와 같이 몇 회차 지속이 되었는지 알아보고자 할 때 다음과 같은 로직을 적용할 수 있다.
options(stringsAsFactors = FALSE)
dd = c("y", "y", "n", "n", "y", "y", "y", "n", "n", "y", "n", "y", "y", "n")

df = data.frame(obs = 1:length(dd),
                vec = dd)
df[, "vec2"] = c(df$vec[1], df$vec[-nrow(df)])
df[, "flag"] = ifelse(df$vec != df$vec2, 1, 0)
df[, "sum" ] = (cumsum(df$flag) + 2) / 2
df[df$vec == "n", "sum"] = 0
df
