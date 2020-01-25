library(dplyr)
library(ggplot2)
library(readxl)

#성별 나누기 
class(welfare$gender)
table(welfare$gender)
table(is.na(welfare$gender))
boxplot(welfare$gender) #이상값이 없으므로 넘어가자 

welfare$gender <- ifelse(welfare$gender == 1, "male", "female")

#성별 직업 빈도 분석 
#남성
job_male <- welfare %>% 
  filter(!is.na(job) & gender == "male") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_male

#여성
job_female <- welfare %>% 
  filter(!is.na(job) & gender == "female") %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_female

#그래프 생성
ggplot(data = job_male, aes(x=reorder(job, n), y=n)) + 
  geom_col()+
  coord_flip()

ggplot(data = job_female, aes(x=reorder(job, n), y=n)) + 
  geom_col()+
  coord_flip()
