#### 1. combn() ####
combn(LETTERS[1:3], m = 2, FUN = c, simplify = TRUE)
as.data.frame(t(combn(LETTERS[1:3], m = 2, FUN = c, simplify = TRUE)))

#### 2. expand.grid ####
expand.grid(LETTERS[1:3], LETTERS[1:3])
