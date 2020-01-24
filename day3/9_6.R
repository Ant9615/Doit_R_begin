library(dplyr)
library(ggplot2)
library(foreign)
library(readxl)

class(welfare$code_job)
table(welfare$code_job)

#코드북을 불러오기, 2015년 기준이지만 2018과 다를 바 없다 
list_job <- read_excel("C:/Users/user/Desktop/work/study/data/Data/Koweps_Codebook.xlsx", col_names=T, sheet=2)
list_job
dim(list_job)

welfare <- left_join(welfare, list_job, id="code_job")
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(6)

#직업별 경상소득 관계 분석 
job_cincome <- welfare %>% 
  filter(!is.na(job) & !is.na(c_income_normalize)) %>% 
  group_by(job) %>% 
  summarise(m_cincome=mean(c_income_normalize))
head(job_cincome)

#상위 정렬 
arran <- job_cincome %>% 
  arrange(desc(m_cincome)) %>% 
  head(10)
arran

#그래프 생성 
ggplot(data=arran, aes(x=reorder(job, m_cincome),y=m_cincome)) +
  geom_col() +
  coord_flip()

#하위 정렬 
b_arran <- job_cincome %>% 
  arrange(m_cincome) %>% 
  head(10)
b_arran

#그래프 생성
ggplot(data=b_arran, aes(x=reorder(job, -m_cincome),y=m_cincome)) +
  geom_col() +
  coord_flip()
