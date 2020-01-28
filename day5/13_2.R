"
상관분석
: 두 연속 변수가 서로 관련이 있는지 검정하는 통계분석이다. 1이하의 값으로 강한상관관계, 상관관계, 약한상관관계 등을 측정하며 공분산을 이용한다. 1에 가까울수록 강한 상관관계를 나타낸다
"
library(ggplot2)
library(dplyr)
library(corrplot)

#load to data with economics in ggplot2
eco <- as.data.frame(ggplot2::economics)

#상관분석
cor.test(eco$unemploy, eco$pce, method = 'spearman')

#상관행렬 히트맵 생성
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor)
corrplot(car_cor, method = "number")
col<-colorRampPalette(c("#BB4444","#EE9988","#FFFFFF","#77AADD","#4477AA"))
corrplot(car_cor,
         method = "color",
         col = col(200),
         type = "lower",
         order = "hclust",
         addCoef.col = "black",
         tl.col = "black",
         tl.srt = 45,
         diag = F)
