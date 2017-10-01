#### Data Creation ####
sample = c("asdf,awfwe,123,12,{adf,wreg,2,gr},21,34,5",
           "adfgf,awe,45,{awsf,wg,132,gaar},234,532")
sample

sample_pattern = gregexpr(pattern = "\\{.*?\\}", text = sample)
sample_pattern
# [[1]]
# [1] 19
# attr(,"match.length")
# [1] 15
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] 14
# attr(,"match.length")
# [1] 18
# attr(,"useBytes")
# [1] TRUE

sapply(sample_pattern, "[[", 1)
# [1] 19 14
sapply(sample_pattern, "[[", FUN = "attr", which = "match.length")
# [1] 15 18

#### unit check ####
substr(sample[1],
       start = sample_pattern[[1]][1],
       stop  = sample_pattern[[1]][1] + attr(sample_pattern[[1]], which = "match.length") - 1)
# [1] "{adf,wreg,2,gr}"

#### extract ####
substr(sample,
       start = sapply(sample_pattern, "[[", 1),
       stop  = sapply(sample_pattern, "[[", 1) + sapply(sample_pattern, "[[", FUN = "attr", which = "match.length") - 1)
# [1] "{adf,wreg,2,gr}"    "{awsf,wg,132,gaar}"
