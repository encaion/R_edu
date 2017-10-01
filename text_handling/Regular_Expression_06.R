test = c("abc", "abcvasdf", "abc_rrrr")
gregexpr(pattern = "||abc&||rrrr", text = test)
# [[1]]
# [1] 1 2 3
# attr(,"match.length")
# [1] 0 0 0
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] 1 2 3 4 5 6 7 8
# attr(,"match.length")
# [1] 0 0 0 0 0 0 0 0
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1] 1 2 3 4 5
# attr(,"match.length")
# [1] 0 0 0 0 4
# attr(,"useBytes")
# [1] TRUE

gregexpr(pattern = "abc.*rrrr", text = test)
# [[1]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1] 1
# attr(,"match.length")
# [1] 8
# attr(,"useBytes")
# [1] TRUE
