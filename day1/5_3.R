#파생변수를 만들어 보자
#파생변수를 생성하는 이유는 변수 조합이나 함수를 적용하여 새 변수를 만들어 분석할 수 있는 것이다.

#5_2에서 생성한 변수 재탕
df_b<-df_a
df_b

#df_b에 있는 두 변수의 합을 생성하는 파생변수를 만들어 보자 
df_b$f_sum <- df_b$f_1 + df_b$f_2
df_b

#합을 구해주는 변수를 이용해서 평균을 내주는 변수를 생성해보자
df_b$f_mean <- df_b$f_sum/2
df_b

#mpg데이터를 이용해서 연비변수를 만들어 보자 
library(ggplot2)
mpg_g<-as.data.frame(ggplot2::mpg)
#mpg데이터 중 cty는 도시연비, hwy는 고속도로 연비
mpg_g$y_mean <- (mpg_g$cty+mpg_g$hwy)/2
head(mpg_g$y_mean, 5)
mean(mpg_g$y_mean)

#y_mean변수를 이용하여 조건문을 이용한 합격판정 변수 생성
#우선 기준값부터 정하자 
summary(mpg_g$y_mean) #평균값이 20.15, 중앙값이 20.50 그럼 20을 기준으로 
mpg_g$test<-ifelse(mpg_g$y_mean >= 20, "P", "F") #평균값이 20이상이면 P 아니면 F
mpg_g$test
#table()을 이용하여 빈도표를 생성해보자 
table(mpg_g$test)
#빈도막대그래프 생성
qplot(mpg_g$test)

#중첩조건문 이용한 파생변수 생성
#ifelse()안에 ifelse()를 넣어서 생성(내 안에 너 있다 음?)
mpg_g$grade <- ifelse(mpg_g$y_mean >= 30, "A", 
                      ifelse(mpg_g$y_mean >= 20, "B", "C")) 
#변수 안의 수 중에 30이상의 값이 있으면 A, 20 이상의 값이 있으면 B, 아니면 C
table(mpg_g$grade)
qplot(mpg_g$grade, color=mpg_g$grade)
#조금 더 세밀하게 해보자 
mpg_g$grade_2 <- ifelse(mpg_g$y_mean >= 30, "A", 
                        ifelse(mpg_g$y_mean >= 25, "B", 
                               ifelse(mpg_g$y_mean >=20, "C","D")))
table(mpg_g$grade_2)

#분석도전
#Q1
library(dplyr)
midw <- as.data.frame(ggplot2::midwest)
str(midw)

#Q2
midw_c <- midw
midw_c <- rename(midw_c, total=poptotal)
midw_c <- rename(midw_c, asian=popasian)

#Q3
midw_c$asian_rate <- (midw_c$asian/midw_c$total)*100
table(midw_c$asian_rate)
qplot(midw_c$asian_rate)

#Q4
asian_rate_m<-mean(midw_c$asian_rate)
midw_c$asian_rate_r<-ifelse(midw_c$asian_rate > asian_rate_m, "large", "small")
table(midw_c$asian_rate_r)
qplot(midw_c$asian_rate_r)
