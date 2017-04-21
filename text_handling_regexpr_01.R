dd = data.frame(obs = 1:3,
                char = c("사과1asdf",
                         "포도2dfgfh",
                         "바나나412ppff"),
                stringsAsFactors = FALSE)

gregexpr(pattern = "[0-9]", dd$char)
# [[1]]
# [1] 3
# attr(,"match.length")
# [1] 1
# 
# [[2]]
# [1] 3
# attr(,"match.length")
# [1] 1
# 
# [[3]]
# [1] 4 5 6
# attr(,"match.length")
# [1] 1 1 1
as.numeric( regexpr(pattern = "[A-z]", dd$char))
# [1] 4 4 7
