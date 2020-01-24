library(dplyr)
library(ggplot2)
library(foreign)

"
#변수
gender  #성별
birth #태어난 연도
marriage #혼인 상태
religion #종교
c_income #경상소득
code_job  #직업 코드
code_region #지역 코드 
"
#변수 검토
class(welfare$birth) #numeric
summary(welfare$birth)
qplot(welfare$birth)

#데이터 전처리 
"
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1907    1947    1967    1969    1989    2017
"
table(is.na(welfare$birth))
"
FALSE 
14923
"
boxplot(welfare$birth) #결측값이 없으므로 넘어가자

#나이 변수생성 
welfare$age <- 2018 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

#나이와 월급의 관계 분석
#나이에 따른 경상소득의 차이 
age_cincome <- welfare %>% 
  filter(!is.na(c_income_normalize)) %>% 
  group_by(age) %>% 
  summarise(m_cincome=mean(c_income_normalize))
head(age_cincome)
ggplot(data = age_cincome, aes(x=age, y=m_cincome)) + geom_line()
