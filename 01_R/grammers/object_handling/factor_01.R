factor(1:10, levels = 10:1)
factor(1:10, labels = 10:1)
factor(1:10, ordered = 1:10)

factor(1:10, labels = 1:5)


df = data.frame(aa = LETTERS[1:5],
                bb = 1:5)
df
sapply(df, "class")

df = data.frame(aa = LETTERS[1:5],
                bb = 1:5,
                stringsAsFactors = FALSE)
df
sapply(df, "class")

fac = factor(1:10, labels = 1:10)
fac[10] = 2
fac_sub = fac[1:5]
fac_sub
fac_sub[6] = 10
fac_sub

fac_sub[6] = 20
fac_sub


fac = factor(sample(LETTERS[1:5], replace = TRUE, size = 30),
             levels = LETTERS[10:1])
fac
as.numeric(fac)

fac = factor(sample(LETTERS[1:10], replace = TRUE, size = 30),
             levels = LETTERS[5:1])
fac
