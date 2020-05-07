library("openNLP")
library("NLP")

s = paste(c("I was wondering if it is possible to extract nouns, verbs separately in R package openNLP?",
            "I use the the tagPOS function which tags the sentence but what to do in case I want to extract verbs, nouns separately."),
           collapse = " ")
s = as.String(s)

sent_token_annotator = Maxent_Sent_Token_Annotator()
word_token_annotator = Maxent_Word_Token_Annotator()
a2 = annotate(s, list(sent_token_annotator, word_token_annotator))

a3 = annotate(s = s, f = Maxent_POS_Tag_Annotator(), a = a2)
a3w = subset(a3, type == "word")

df_a3w = data.frame(word = s[a3w],
                    tag = sapply(a3w$features, `[[`, "POS"))
head(df_a3w)

df_noun = df_a3w[grep(pattern = "^NN", df_a3w$tag), ]
df_noun
