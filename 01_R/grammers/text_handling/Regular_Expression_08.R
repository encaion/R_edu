text = "1234 asdfASDF  ㄱㄴㄷㄹㅏㅑㅓㅕ가나다라   .!@#"
gsub(pattern = "[0-9]", replacement = "", x = text)
gsub(pattern = "[a-z]", replacement = "", x = text)
gsub(pattern = "[A-Z]", replacement = "", x = text)
gsub(pattern = "[ㄱ-ㅎ]", replacement = "", x = text)
gsub(pattern = "[ㅏ-ㅟ]", replacement = "", x = text)
gsub(pattern = "[가-힣]", replacement = "", x = text)
gsub(pattern = " ", replacement = "", x = text)
gsub(pattern = "  ", replacement = "", x = text)
gsub(pattern = "   ", replacement = "", x = text)

gsub(pattern = "[^0-9]", replacement = "", x = text)
gsub(pattern = "[a-zA-Z]", replacement = "", x = text)
gsub(pattern = "[ㄱ-힣]", replacement = "", x = text)
gsub(pattern = "[0-9A-Z]", replacement = "", x = text)

gsub(pattern = "[2-3]", replacement = "", x = text)

gsub(pattern = ".", replacement = "", x = text)
gsub(pattern = "\\.", replacement = "", x = text)

gsub(pattern = " {2,3}", replacement = "", x = text)

gsub(pattern = "asdf|가나다라", replacement = "", x = text)

gsub(pattern = "[13]", replacement = "", x = "123456789")
gsub(pattern = "[1-37-9]", replacement = "", x = "123456789")

text_2 = "<a> <ab> <abc> <abcd>"
gsub(pattern = "<.*?>", replacement = "", x = text_2)
gsub(pattern = "<.{1}>", replacement = "", x = text_2)
gsub(pattern = "<.{2,4}>", replacement = "", x = text_2)

gsub(pattern = "<..>|<...>|<....>", replacement = "", x = text_2)
gsub(pattern = "<.{2}>|<.{3}>|<.{4}>", replacement = "", x = text_2)

gsub(pattern = ".{2}", replacement = "", x = "abcde")
gsub(pattern = ".{2}", replacement = "", x = "abcdef")


# 텍스트 조건
text_2 = c("aaa", "bbb", "ccc", "abc")
grep(pattern = "a", x = text_2)
grep(pattern = "a", x = text_2, value = TRUE)

grep(pattern = "b", x = text_2)
grep(pattern = "^b", x = text_2)
grep(pattern = "b$", x = text_2)

grep(pattern = "[a-b]", x = text_2)
grep(pattern = "[a-b]", x = text_2, value = TRUE)

grepl(pattern = "[a-b]", x = text_2)
text_2[ grepl(pattern = "[a-b]", x = text_2)]
text_2[!grepl(pattern = "[a-b]", x = text_2)]
