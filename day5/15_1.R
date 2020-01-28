library(dplyr)
library(ggplot2)

## 내장함수로 데이터 추출하기 

## 데이터 로드 
ex<- read.csv("C:/Users/user/Desktop/work/study/data/Data/csv_exam.csv")

## 조건을 입력하는 형태로 구성 
ex[]

##행추출 
##1행 추출 
ex[1,]

##조건을 충족하는 행 추출 하기 
ex[ex$class==1,] ##class가 1인 행 추출 
ex[ex$math>=60, ] ##수학점수가 60점 이상인 행 추출 
ex[ex$class==1 & ex$math>=60, ] ##1반이면서 수학점수가 60점 이상인 행 
ex[ex$english < 80 | ex$science >60, ] #영어점수가 80미만이거나 과학점수가 60 초과인 행행


##열추출 
ex[,2] ##두번 째 열 추출(class)

##변수명으로 변수 추출
ex[, "class"]  
ex[, c("class","math","science")]##class, math, science 동시 추출 

##행, 변수 동시 추출 
ex[1,3] ##1행 3열 데이터 추출 
ex[3, "english"] ##3행 english  추출 
ex[ex$math>=60, "science"] ##수학점수가 60점 이상인 과학 점수
ex[ex$math>=60, c("science","english")] ##수학점수가 60점 이상인 과학, 영어 점수

## dplyr과 차이점 
## 과학점수 60이상 영어점수 80이상인 학생 대상으로 각 반의 전 과목 총 평균(평균값은 소수점 두번째 숫자까지 출력)
## 내장함수 
ex$tot<-(ex$math+ex$english+ex$science)/3
round(aggregate(data=ex[ex$science>=60 & ex$english>=80,], tot~class, mean),2)

## dplyr 
ex %>% 
  filter(math >= 60 & english >=80) %>% 
  mutate(d_tot=(math+english+science)/3) %>% 
  group_by(class) %>% 
  summarise(mean=mean(d_tot))

## 혼자 해보기 
mpg <- as.data.frame(ggplot2::mpg)
mpg_r <- mpg
mpg_r$tot_m <- (mpg_r$cty  + mpg_r$hwy)/2
mpg_com <- mpg_r[mpg_r$class == "compact",]
mpg_suv <- mpg_r[mpg_r$class == "suv",]
round(mean(mpg_com$tot_m),2)
round(mean(mpg_suv$tot_m),2)
