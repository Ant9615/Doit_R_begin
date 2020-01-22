# 데이터 전처리는 분석에 적합하게 데이터를 가공하는 작업이다. 
# dplyr 패키지를 이용하여 전처리를 해보자

library(dplyr)
df_ex<-read.csv("경로/파일명.csv")
head(df_ex)

#class가 1인 행만 출력
#filter()에 조건을 입력하면 해당 조건에 해당하는 행만 추출함 
#조건에 같다라고 할 땐 등호 두개로 파라미터에 할 땐 등호 하나만 
df_ex %>% filter(class==1) # %>% 은 파이프인데 함수들을 연결해주는 역할을 한다
df_ex %>% filter(class!=1) #class가 1이 아닐 때

#초과,미만, 이상
df_ex %>% filter(math>50) #수학점수가 50초과인 경우
df_ex %>% filter(math<=50) #수학점수가 50이하인 경우
df_ex %>% filter(english>=80) #영어점수가 80이상인 경우

#여러조건 
df_ex %>% filter(class==1 & math>=50) #1반 중에 수학점수가 50이상인 경우
df_ex %>% filter(math>50 | english>=80) #수학점수가 50초과거나 영어점수가 80점 이상인 경우
df_ex %>% filter(class==1 | class==3 & class==5) #1반이거나 3반과 5반인 경우
df_ex %>% filter(class==1 | class==3 | class==5) #1반이거나 3반이거나 5반인 경우
#1반이거나 3반이거나 5반인 경우를 매치연산자(%in%)를 통해 간결화할 수 있다
df_ex %>% filter(class %in% c(1,3,5))

#추출한 행을 데이터로 만들기
c_1 <- df_ex %>% filter(class==1) #c_1에 1반인 행만 추출한 데이터를 할당
c_2 <- df_ex %>% filter(class==2) #c_2에 2반인 행만 추출한 데이터를 할당
c_1
c_2
mean(c_1$math)
mean(c_2$math)
var(c_1$math) #1반 수학점수 분산값 

#혼자 해보기 
#Q1
library(ggplot2)
mpg_a<-as.data.frame(ggplot2::mpg)
dis_4<-mpg_a %>% filter(mpg_a$displ<=4)
mean(dis_4$hwy)
dis_5<-mpg_a %>% filter(mpg_a$displ>=5)
mean(dis_4$hwy)-mean(dis_5$hwy) #dis_4d의 hwy의 평균값이 dis_5의 hwy평균값보다 약 7.88로 큼


#Q2 
audi<-mpg_a %>% filter(mpg_a$manufacturer == "audi")
toyota<-mpg_a %>% filter(mpg_a$manufacturer == "toyota")
mean(audi$cty) - mean(toyota$cty) #audi의 평균도시연비가 toyota의 평균도시연비보다 약 0.918로 작음

#Q3 
Q3 <- mpg_a %>% filter(mpg_a$manufacturer %in% c("chevrolet", "ford", "honda"))
mean(Q3$hwy)
