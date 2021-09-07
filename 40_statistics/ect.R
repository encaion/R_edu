library("ggplot2")

#### 정규성 검정 ####
# Kolmogorov-Smirnov test
x = rnorm(50); y = rnorm(50); z = runif(50)
ks.test(x, y)
ks.test(x, z)


# Shapiro-Wilk test
# install.packages("nortest")

z = rnorm(100)
shapiro.test(z) # Shapiro-Wilk test

library("nortest")
ad.test(z) # Anderson-Darling normality test
cvm.test(z) # Cramer-von Mises normality test
lillie.test(z) # Lilliefors (Kolmogorov-Smirnov) test for normality
pearson.test(z) # Pearson chi-square test for normality
sf.test(z) # Shapiro-Francia test for normality

#### z-test ####
# 표준 정규 분포를 따르는 Z-통계량 기반의 가설 검정
# 연속형 자료(continuous data)에 사용
# 모집단의 평균과 분산을 알고있는 경우 사용
# 일반적으로 표본 크기가 30 이상인 경우 사용


prop.test(x = 170, 1000, p = 0.20)
# 1-sample proportions test with continuity correction
# 
# data:  170 out of 1000, null probability 0.2
# X-squared = 5.4391, df = 1, p-value = 0.01969
# alternative hypothesis: true p is not equal to 0.2
# 95 percent confidence interval:
#   0.1475206 0.1950591
# sample estimates:
#   p 
# 0.17 

#### t-test ####
# 자유도가(n-1)인 t분포를 따르는 두 집단간 평균 차이 검정
# 모집단의 평균과 표본집단의 평균 및 분산을 갈고 있는 경우 사용
# 연속형 자료(continuous data)에 사용
# 귀무가설: 두 표본집단의 평균은 같다.
# 대립가설: 두 표본집단의 평균은 같지 않다.

# 단일 표본 t-test(one sample t-test)
# 단일 모집단에서 추출된 하나의 표본이 대상
set.seed(123)
t.test(x = rnorm(300), mu = 0)

# 표본 개수에 따른 시뮬레이션

set.seed(1234)
aa = rnorm(100, mean = 5, sd = 4)
bb = rnorm(100, mean = 8, sd = 4)
# 대응 표본 t-test(paired sample t-test)
# 동일한 모집단으로부터 추출된 두 표본집단을 대상
# 표본이 30개 이하이고, 정규성을 만족하지 못하는 경우 Willcoxon rank sum test 사용
t.test(x = aa, y = bb, paired = TRUE)

# 독립 표본 t-test(independent sample t-test)
# 독립된 두 표본집단을 대상
# 두 표본집단들은 등분산성을 만족
# 표본이 30개 이하이고, 정규성을 만족하지 못하는 경우 Mann-Whitney test 사용


# Levene 등분산 검정
# 귀무가설: 표본집단의 분산은 같다.
# 대립가설: 표본집단의 분산은 같지 않다.
set.seed(1228)
df = data.frame(obs = 100,
                values = c(rbinom(n = 10, size = 20, prob = 0.5),
                           rbinom(n = 10, size = 20, prob = 0.5)),
                group = rep(c("a", "b"), each = 10))
head(df, 3)
car::leveneTest(values ~ group, data = df)

set.seed(4925)
df = data.frame(obs = 100,
                values = c(rbinom(n = 10, size = 80, prob = 0.5),
                           rbinom(n = 10, size = 15, prob = 0.5)),
                group = rep(c("a", "b"), each = 10))
head(df, 3)
car::leveneTest(values ~ group, data = df)


t.test(x = aa, y = bb, paired = FALSE)


#### Wilcoxon rank sum test ####
# 표본이 정규성 검정을 만족하지 못할 경우 사용
# 두 표본집단의 크기 차이를 검정
# 일반적으로 독립표본 t-test에 비해 검정력이 낮다.
# 이 검정에서 표본의 평균과 표준편차는 의미가 없다.
# wilcox.test()

data("immer", package = "MASS")
wilcox.test(x = immer$Y1, y = immer$Y2, paired = TRUE)

#### chisq-test ####
# 두 변수의 연관성을 검정하는 방법
# 범주형 자료(categorical data)에 사용
# 기대빈도가 5 미만 셀이 전체의 20%가 넘을 경우 피셔의 정확한 검정(Fisher's exact test) 사용
# 적합도 검정, 독립성 검정, 동질성 검정이 있다.

# - 분석대상의 자료들이 무작위로 추출된 것이어야 하며, 반복이 없어야 한다.
# - χ2값은 표본 크기에 절대적으로 영향을 받는다. 즉 대단위 조사자료를 대상으로 χ2검증을 하는 것은 무의미하다.
# - 2×2 교차표의 경우 한칸의 기대빈도가 적어도 10이상, 그 이상의 교차표에서는 기대빈도가 적어도 5이상은 되어야 한다.
# - χ2는 연관성의 존재여부를 탐색할 뿐 연관성의 강도나 방향을 말하지는 않는다

# 1) 적합도 검정
# ①단순적합도검정 : 단일기준에 의거하여 구분된 표본정보를 근거로 작성된 관측도수가
#   모집단의 예상되는 기대도수 또는 예상도수와 어느 만큼 부합하는지 여부를 판정하는 것
# ②모집단의 분포형태에 관한 가설검정
# 귀무가설: 확률변수가 특정한 분포를 따른다.
# 대립가설: 확률변수가 특정한 분포를 따르지 않는다.

# 2) 독립성 검정
# 적합도검정이 단일기준에 의해 분류된 표본에 적용되는 것이라면, 복수기준에 의해 분류된 표본의 경우는 독립성검정과 동질성 검정으로 구분할 수 있다.
# 귀무가설: 두 변수는 서로 독립이다.
# 대립가설: 두 변수는 서로 독립이 아니다.

# 
# 3) 동질성분석
# 행변수의 각 변수를 하나하나 독립된 모집단으로 간주하여 
# 열 변수의 분포가 모든 모집단에서 동일한지를 검정(각 행의 주변(marginal)합의 비율이 1인 점이 독립성검정과 다른 점)
# 귀무가설: (행변수의) 모든 집단에서 열 변수의 비율은 서로 같다.
# 대립가설: (행변수의) 모든 집단에서 열 변수의 비율은 서로 같지 않다.


# type 1 - goodness of fit
# 귀무가설: 표본집단 도수와 가정한 이론적 도수가 동일하다.
# 대립가설: 적어도 하나의 표본집단 도수가 가정한 이론적 도수와 다르다.

# OO 항공에서는 이벤트에 당첨된 사람 500명의 항공권 좌석등급을 추첨으로 결정하였다.
# 추첨에 앞서 항공사는 각 좌석등급에 따른 당첨 확률을 아래와 같이 고지하였다.
# A등급 1%, B등급 10%, C등급 25% 나머지는 D등급
# 500명의 추첨 결과가 다음과 같을 때. 가설을 수립하고 검증하라.
# A = 6, B = 84, C = 140, D = 270
df = data.frame(obs = 1:1000,
                type = rep(c("A", "B", "C", "D"), times = c(10, 100, 250, 640)),
                stringsAsFactors = FALSE)
table(df$type)
prop.table(table(df$type))
chisq.test(c(6, 84, 140, 270), p = prop.table(table(df$type)))

chisq.test(table(df$type), p = prop.table(table(df$type)))

# 평균(z-test, t-test, wilcoxon), 분산(Levene), 비율(chisq-test)

