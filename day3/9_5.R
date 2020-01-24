library(dplyr)
library(ggplot2)
library(foreign)

#연령대 및 성별 경상소득 평균표 만들기  
gender_cincome <- welfare %>% 
  filter(!is.na(c_income_normalize)) %>% 
  group_by(ageg, gender) %>% 
  summarise(m_cincome=mean(c_income_normalize)) 
gender_cincome

#그래프 생성 
ggplot(data=gender_cincome, aes(x=ageg, y=m_cincome, fill=gender)) + 
  geom_col() + #position = "dodge"를 하면 막대를 분리할 수 있다 
  scale_x_discrete(limits=c("young","middle","old"))

#나이 및 성별 경상소득 차이 분석하기 
gender_age <- welfare %>% 
  filter(!is.na(c_income_normalize)) %>% 
  group_by(age, gender) %>% 
  summarise(m_cincome = mean(c_income_normalize))
head(gender_age)

#그래프 생성 
ggplot(data=gender_age, aes(x=age, y=m_cincome, col=gender)) + geom_line()
