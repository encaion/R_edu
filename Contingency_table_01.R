set.seed(1234)
Truth = factor(sample(0:1, size = 150, replace = TRUE), levels = 1:0)
Result = factor(sample(0:1, size = 150, replace = TRUE), levels = 1:0)
table = table(Result, Truth)
table

sum(table[1, 1], table[2, 2])/sum(table) # Accuracy
table[1, 1]/sum(table[1, 1:2]) # Precision
table[1, 1]/sum(table[1:2, 1]) # Recall
