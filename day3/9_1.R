library(dplyr)
library(ggplot2)
library(foreign)

welfare <- read.spss("C:/Users/user/Desktop/work/study/data/Data/Koweps_hpc13_2018_beta1.sav",
                     to.data.frame = T) 
#to.data.frame는 SPSS 파일을 데이터 프레임 형태로 변환하는 기능을 함. 설정하지 않으면 데이터를 리스트로 불러옴 

#데이터 검토 
head(welfare)
tail(welfare)
dim(welfare)
str(welfare)
summary(welfare)
View(welfare)


#변수명 바꾸기 
welfare <- rename(welfare,
                  gender = h13_g3, #성별
                  birth= h13_g4, #태어난 연도
                  marriage = h13_g10, #혼인 상태
                  religion = h13_g11, #종교
                  c_income = h13_cin, #경상소득
                  code_job = h13_eco9, #직업 코드
                  code_region = h13_reg7) #지역 코드 

" 경상소득은 가구원이 근로제공 등의 대가로 받는, 비교적 정기적이고 예측이 가능한, 경상적으로 발생하는 소득을 말한다
"