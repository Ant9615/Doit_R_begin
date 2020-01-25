library(dplyr)
library(ggplot2)
library(readxl)

#종교 변수 검토
class(welfare$religion)
table(welfare$religion)

#종교 변수 전처리 
welfare$religion <- ifelse(welfare$religion==1, "yes","no")
qplot(welfare$religion)

#혼인 변수 검토
class(welfare$marriage)
table(welfare$marriage)

#혼인 변수 전처리
welfare$g_marriage <- ifelse(welfare$marriage==1, "marriage",
                           ifelse(welfare$marriage==3, "divorce", NA))
table(welfare$marriage)
table(is.na(welfare$marriage))
qplot(!is.na(welfare$marriage))

#종교 유무에 따른 이혼율표 생성
religion_marriage <- welfare %>% 
  filter(!is.na(g_marriage)) %>%
  group_by(religion, g_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(t_group = sum(n)) %>% 
  mutate(pct=round(n/t_group*100, 1))
religion_marriage

#이혼율표 추출 
divorce <- religion_marriage %>% 
  filter(g_marriage=="divorce") %>% 
  select(religion, pct)
divorce
ggplot(data = divorce, aes(x=religion, y=pct)) + geom_col()

#연령대 및 종교 유무에 따른 이혼율 분석 
#연령대별 이혼률 표
ageg_marriage <- welfare %>% 
  filter(!is.na(g_marriage)) %>% 
  group_by(ageg, g_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(t_group=sum(n)) %>% 
  mutate(pct=round(n/t_group*100, 1))
ageg_marriage

#연령대별 이혼율 그래프 
ageg_divorce <- ageg_marriage %>% 
  filter(ageg != "young" & g_marriage == "divorce") %>% 
  select(ageg, pct)
ageg_divorce
ggplot(data = ageg_divorce, aes(x=ageg, y=pct)) + geom_col()

#연령대 및 종교유무에 따른 이혼율 표
ageg_re_ma <- welfare %>% 
  filter(!is.na(g_marriage) & ageg !="young") %>% 
  group_by(ageg, religion, g_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(t_group=sum(n)) %>% 
  mutate(pct = round(n/t_group*100, 1))
ageg_re_ma

#연령대 및 종교 유무별 이혼률 표
df_divorce <- ageg_re_ma %>% 
  filter(g_marriage == "divorce") %>% 
  select(ageg, religion, pct)
df_divorce
