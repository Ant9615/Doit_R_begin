library(dplyr)
library(ggplot2)
library(foreign)

#연령대 파생변수 생성 
welfare <- welfare %>% 
  mutate(ageg = ifelse(age<30, "young",
                       ifelse(age<= 50, "middle", "old")))
table(welfare$ageg)
"
middle    old  young 
  3517   7727   3679
"
qplot(welfare$ageg)

#연령대별 경상소득 평균표
ageg_cincome <-welfare %>% 
  filter(!is.na(c_income_normalize)) %>% 
  group_by(ageg) %>% 
  summarise(m_cincome=mean(c_income_normalize))
ageg_cincome
#그래프 생성
ggplot(data=ageg_cincome, aes(x=ageg, y=m_cincome)) + 
  geom_col() + 
  scale_x_discrete(limits=c("young","middle","old")) #초년, 중년, 노년으로 정렬하기 

