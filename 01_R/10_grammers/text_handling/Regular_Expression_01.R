sample_text = c("asdf", "1234", "123$", "# z)", "QWER")
sample_text

regexpr(pattern = "[0-9]", sample_text)
# [1] -1  1  1 -1 -1
# attr(,"match.length")
# [1] -1  1  1 -1 -1
# attr(,"useBytes")
# [1] TRUE

gregexpr(pattern = "[0-9]", sample_text)
# [[1]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"useBytes")
# [1] TRUE
# 
# [[2]]
# [1] 1 2 3 4
# attr(,"match.length")
# [1] 1 1 1 1
# attr(,"useBytes")
# [1] TRUE
# 
# [[3]]
# [1] 1 2 3
# attr(,"match.length")
# [1] 1 1 1
# attr(,"useBytes")
# [1] TRUE
# 
# [[4]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"useBytes")
# [1] TRUE
# 
# [[5]]
# [1] -1
# attr(,"match.length")
# [1] -1
# attr(,"useBytes")
# [1] TRUE

grep(pattern = "[0-9]", sample_text)
# [1] 2 3
grep(pattern = "[0-9]", sample_text, value = TRUE)
# [1] "1234" "123$"




?regex

# [:alnum:]
# Alphanumeric characters: [:alpha:] and [:digit:].
# 
# [:alpha:]
# Alphabetic characters: [:lower:] and [:upper:].
# 
# [:blank:]
# Blank characters: space and tab, and possibly other locale-dependent characters such as non-breaking space.
# 
# [:cntrl:]
# Control characters. In ASCII, these characters have octal codes 000 through 037, and 177 (DEL). In another character set, these are the equivalent characters, if any.
# 
# [:digit:]
# Digits: 0 1 2 3 4 5 6 7 8 9.
# 
# [:graph:]
# Graphical characters: [:alnum:] and [:punct:].
# 
# [:lower:]
# Lower-case letters in the current locale.
# 
# [:print:]
# Printable characters: [:alnum:], [:punct:] and space.
# 
# [:punct:]
# Punctuation characters:
#   ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~.
# 
# [:space:]
# Space characters: tab, newline, vertical tab, form feed, carriage return, space and possibly other locale-dependent characters.
# 
# [:upper:]
# Upper-case letters in the current locale.
# 
# [:xdigit:]
# Hexadecimal digits:
# 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f.






# more info - http://stat545.com/block022_regular-expression.html
