sample = data.frame(aa = c("abc_sdfsdf", "abc_KKdfsfsfs", "ccd"),
                    bb = 1:3,
                    stringsAsFactors = FALSE)
sample


# 문자 개수 세기
nchar(sample[1,1])

# 위치 확인
which(sample[,1] == "ccd")

# 대문자
toupper(sample[1,1])

# 소문자
tolower(sample[2,1])

# 문자열 분리
library("splitstackshape")
cSplit(sample, splitCols = "aa", sep = "_")


# 문자열 결합
paste0(sample[, 1], sample[, 2])
paste(sample[, 1], sample[, 2], sep = " HAHAHA ")

# 일부 추출
substr(sample[,1], 1, 2)

# 패턴 매칭 추출
grep(pattern = "^abc", x = sample$aa, value = TRUE) # 앞에
grep(pattern = "fs", x = sample$aa, value = TRUE) # 중간
grep(pattern = "fs$", x = sample$aa, value = TRUE) # 뒤에
grep(pattern = "^.bc", x = sample$aa, value = TRUE) # wild card
grep(pattern = "^.{8}df", x = sample$aa, value = TRUE) # wild card가 너무 많을때

# 매칭 패턴 치환
gsub() # 일치하는 내용 전체를 바꿈
sub() # 첫 번째 일치하는 내용을 바꿈
