gregexpr(pattern = "[0-9]", text = "asdf1234ASDF")
# [[1]]
# [1] 5 6 7 8
# attr(,"match.length")
# [1] 1 1 1 1
# attr(,"useBytes")
# [1] TRUE

gregexpr(pattern = "[a-z]", text = "asdf1234ASDF")
# [[1]]
# [1] 1 2 3 4
# attr(,"match.length")
# [1] 1 1 1 1
# attr(,"useBytes")
# [1] TRUE

gregexpr(pattern = "[A-Z]", text = "asdf1234ASDF")
# [[1]]
# [1]  9 10 11 12
# attr(,"match.length")
# [1] 1 1 1 1
# attr(,"useBytes")
# [1] TRUE

gregexpr(pattern = "[a-zA-Z]", text = "asdf1234ASDF")
# [[1]]
# [1]  1  2  3  4  9 10 11 12
# attr(,"match.length")
# [1] 1 1 1 1 1 1 1 1
# attr(,"useBytes")
# [1] TRUE

gregexpr(pattern = "[ㄱ-ㅎ]", text = "ㄱㄴ12가나34ㅏㅣ")
# [[1]]
# [1] 1 2
# attr(,"match.length")
# [1] 1 1


gregexpr(pattern = "[ㅏ-ㅣ]", text = "ㄱㄴ12가나34ㅏㅣ")
# [[1]]
# [1]  9 10
# attr(,"match.length")
# [1] 1 1

gregexpr(pattern = "[가-힣]", text = "ㄱㄴ12가나34ㅏㅣ")
# [[1]]
# [1] 5 6
# attr(,"match.length")
# [1] 1 1
