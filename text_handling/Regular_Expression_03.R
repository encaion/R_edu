sample_text = "\t\t\t\t\t\t\t<p><strong><span style=\"font-size: 12pt;\"><font color=\"#0075C8\" style=\"background-color: rgb(245, 244, 224);\">안녕 하세요^^</font>"
gsub(pattern = "<.*?>|\t", replacement = "", x = sample_text)
# [1] "안녕 하세요^^"
