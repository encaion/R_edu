# install.packages("wordcloud2")
library("wordcloud2")

wordcloud2(demoFreq)

wordcloud2(data = head(demoFreq))

wordcloud2(data = demoFreq,
           minSize = 20)
# minSize 기본값이 0 으로 설정되어 있어 매우 작은 글자 까지 표기됨.

wordcloud2(data = demoFreq,
           minSize = 20, size = 2)
wordcloud2(data = demoFreq,
           minSize = 20, size = 4)
# size 기본값은 1 로 설정되어 있으며 큰 값을 줄 수록 글자 크기가 대체로 커짐

wordcloud2(data = demoFreq,
           minSize = 20,
           size = 4, 
           fontWeight =  "bold") # 기본 값
wordcloud2(data = demoFreq,
           minSize = 20,
           size = 4, 
           fontWeight =  "normal") # 좀 더 얇게 나옴
wordcloud2(data = demoFreq,
           minSize = 20,
           size = 4, 
           fontWeight = NULL)
# NULL 로 하면 크기가 작은 글자들만 잔뜩 나옴


wordcloud2(data = demoFreq,
           minSize = 20,
           size = 2, 
           fontWeight =  "bold", 
           rotateRatio = 0.5,
           minRotation = NISTunits::NISTdegTOradian(90), 
           maxRotation = NISTunits::NISTdegTOradian(90))
