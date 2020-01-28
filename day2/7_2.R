#이상치 정제하기 
library(dplyr)
library(ggplot2)

#이상치 제거하기 
outlier <- data.frame(factor=c(1,2,1,3,2,1),
                      score=c(5,4,3,4,2,6))
outlier
table(outlier$factor) #sex에 3이 있음
table(outlier$score) #score에 이상치 6이 있음
#결측처리 
outlier$factor <- ifelse(outlier$factor == 3, NA, outlier$factor)
outlier$score <- ifelse(outlier$score == 6, NA, outlier$score)
#켤측치 제외 후 factor에 따른 score평균
outlier %>% 
    filter(!is.na(factor)&!is.na(score)) %>% 
    group_by(factor) %>% 
    summarise(m_score = mean(score))

#극단적인 이상치 제거
"
상자그림을 이용하여 극단적인 이상치를 제거한다. 상자그림은 사분위수로 나뉘는데 
1사분위(1Quarter)는 하위 25%, 
2사분위(2Quarter)는 평균(일반적으로 그냥 평균이라고 함), 
3사분위(3Quarter)는 하위 75%값이다.
"
mpg_a <- as.data.frame(ggplot2::mpg)
boxplot(mpg_a$hwy)$stats #12~37을 벗어나면 결측치이다 
mpg_a$hwy <- ifelse(mpg_a$hwy<12|mpg_a$hwy>37, NA, mpg_a$hwy) #boxplot에서 얻은 정보를 토대로 결측처리
table(is.na(mpg_a$hwy)) 
mpg_a %>% 
    group_by(drv) %>% 
    summarise(m_hwy=mean(hwy, na.rm = T))

#혼자 해보기 
mpg_b <- as.data.frame(ggplot2::mpg)
mpg_b[c(10,14,58,93),"drv"] <- "NA"
mpg_b[c(29,43,129,203),"cty"] <- c(3,4,39,42)

#Q1
table(mpg_b$drv) 
mpg_b$drv<- ifelse(mpg_b$drv %in% c("4","f","r"), mpg_b$drv, NA)
table(mpg_b$drv)

#Q2
boxplot(mpg_b$cty)
summary(mpg_b$cty)
mpg_b$cty <- ifelse(mpg_b$cty<14 | mpg_b$cty>19, NA, mpg_b$cty)
boxplot(mpg_b$cty)

#Q3
mpg_b %>%  
    filter(!is.na(cty) & !is.na(drv)) %>% 
    group_by(drv) %>% 
    summarise(m_cty=mean(cty))
