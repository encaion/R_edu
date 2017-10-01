tt = "213kjhwef_qwlkn_2018-02-13 _asdf_2017-05-17_dd"

gregexpr(pattern = "[0-9]{4}-[0-9]{2}-[0-9]{2} ", text = tt)
# [[1]]
# [1] 17
# attr(,"match.length")
# [1] 11
# attr(,"useBytes")
# [1] TRUE

substr(tt, start = 17, stop = 17 + 11 - 1)
# [1] "2018-02-13 "
