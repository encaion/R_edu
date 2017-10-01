#### reading ####
# install.packages("imager")
library("imager")
library("ggplot2)

img = load.image("counting_dots_lssacLee.jpg")
plot(img, axes = FALSE)

str(img)
dim(img)

# load.image() 함수로 불러온 객체는 4차원 행렬이다.
img[,,1,]

img_melt = reshape2::melt(img[,,1,])

ggplot() + 
  geom_tile(data = img_melt,
            aes(x = Var1,
                y = Var2,
                fill = as.factor(value))) + 
  scale_fill_grey() + 
  theme(legend.position = "none")



#### blur 처리 ####
isoblur(im = img, sigma = 1) %>% plot(axes = FALSE)
isoblur(im = img, sigma = 3) %>% plot(axes = FALSE)
isoblur(im = img, sigma = 5) %>% plot(axes = FALSE)
isoblur(im = img, sigma = 7) %>% plot(axes = FALSE)

isoblur(boats, 1) %>% plot(main="Isotropic blur, sigma = 1", axes = FALSE)
isoblur(boats, 3) %>% plot(main="Isotropic blur, sigma = 3", axes = FALSE)
isoblur(boats, 5) %>% plot(main="Isotropic blur, sigma = 5", axes = FALSE)
isoblur(boats, 7) %>% plot(main="Isotropic blur, sigma = 7", axes = FALSE)

#### edges ####
deriche(im = boats, sigma = 2, order = 2, axis = "x") %>% plot(axes = FALSE)
deriche(im = boats, sigma = 2, order = 2, axis = "y") %>% plot(axes = FALSE)

deriche(im = boats, sigma = 2, order = 2, axis = "x") %>%
  deriche(sigma = 2, order = 2, axis = "y") %>%
  plot(axes = FALSE)


deriche(im = img, sigma = 2, order = 2, axis = "x") %>% plot(axes = FALSE)
deriche(im = img, sigma = 2, order = 2, axis = "y") %>% plot(axes = FALSE)

deriche(im = img, sigma = 2, order = 2, axis = "x") %>%
  deriche(sigma = 2, order = 2, axis = "y") %>%
  plot(axes = FALSE)


#### denoising ####
img_denoising = img
img_denoising[img_denoising < quantile(img_denoising[img_denoising > 0], 0.99)] = 0
plot(img_denoising, axes = FALSE)

#### binary ####
img_bw = img
img_bw[img_bw <  quantile(img_bw, 0.99)] = 0
img_bw[img_bw != 0] = 1
plot(img_bw, axes = FALSE)
# 이건 좀 별론데?

#### HSV(Hue(색상), Saturation(채도), Value(명도)) ####
img_HSV = img
img_HSV = RGBtoHSV(img_HSV)
plot(img, axes = FALSE)
plot(img_HSV, axes = FALSE)

#### HSL ####
img_HSL = img
img_HSL = RGBtoHSL(img_HSL)
plot(img, axes = FALSE)
plot(img_HSL, axes = FALSE)


#### HSI ####
img_HSI = img
img_HSI = RGBtoHSI(img_HSI)
plot(img, axes = FALSE)
plot(img_HSI, axes = FALSE)

# 뭐야 이거.


img_2 = img
img_2[img_2 < quantile(img_2[img_2 > 0], 0.99)] = 0
deriche(im = img_2, sigma = 1, order = 2, axis = "x") %>%
  deriche(sigma = 2, order = 2, axis = "y") %>%
  plot(axes = FALSE)


ggplot() + 
  geom_line(aes(x = 1:dim(img)[1],
                y = imrow(R(img), 30)))

# imrow로 데이터를 뽑아볼까?
aa = c(img[, 200,, 1])
bb = imrow(R(img), 200)
sum(aa == bb)/length(aa)

# imcol은?
cc = c(img[200,,, 1])
dd = imcol(R(img), 200)
sum(cc == dd)/length(cc)


# 값을 반올림?
# 어차피 RGB 값은 각각 0부터 1사이의 값을 가지고 있다.
# 단위 함수로 만들어버리면 오히려 처리하기 쉬울 수 있다.
# 그런데... 원(점)이 선명하지 않고 색이 얼룩덜룩하면?..
# 점이 겹쳐있으면?

#### 참고 사이트 ####
# https://dahtah.github.io/imager/imager.html
# https://cran.r-project.org/web/packages/imager/vignettes/gettingstarted.html
# https://cran.r-project.org/web/packages/magick/vignettes/intro.html
# http://darkpgmr.tistory.com/132
