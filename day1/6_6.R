library(dplyr)
library(ggplot2)

#일단 재탕
df_ex66<-df_exam 

#수학평균을 구해서 변수에 할당
df_ex66 %>% summarise(m_math = mean(math))

#집단별 요약
#group_by()를 이용해서 반별로 묶고 수학평균점수 출력
df_ex66 %>% 
    group_by(class) %>% 
    summarise(m_math = mean(math))

#집단별 요약통계량 산출
df_ex66 %>%  
    group_by(class) %>% 
    summarise(m_math = mean(math),
              m_english = mean(english),
              m_science = mean(science),
              s_math = sum(math),
              s_english = sum(english),
              s_science = sum(science),
              num=n(),) #학생수

#하위집단별로 나누기 
mpg %>% 
    group_by(manufacturer, drv) %>% #제조회사별, 구동별로 분리
    summarise(m_cty = mean(cty)) %>% #도시연비로 평균 산출
    head(5)

#dplyr 조합
mpg %>% 
    group_by(manufacturer) %>% 
    filter(class=='suv') %>% 
    mutate(HCT = (hwy+cty)/2) %>% 
    summarise(m_HCT = mean(HCT)) %>% 
    arrange(desc(m_HCT)) %>% 
    head(5)

#혼자서 해보기 
#Q1
mpg %>% 
    group_by(class) %>% 
    select(class, cty) %>%
    summarise(m_cty = mean(cty))
#번외(class 중 suv와 compact만 보고 싶을 때)
mpg %>% 
    group_by(class) %>% 
    select(class, cty) %>%
    filter(class %in% c('suv', 'compact')) %>% 
    summarise(m_cty = mean(cty))
#Q2
mpg %>% 
    group_by(class) %>% 
    select(class, cty) %>%
    summarise(m_cty = mean(cty)) %>% 
    arrange(desc(m_cty))
#Q3
mpg %>% 
    group_by(manufacturer) %>% 
    select(manufacturer, hwy) %>% 
    summarise(m_hwy = mean(hwy)) %>% 
    arrange(desc(m_hwy)) %>% 
    head(3)
#Q4
mpg %>% 
    group_by(manufacturer) %>% 
    select(manufacturer, class) %>% 
    filter(class=='compact') %>% 
    summarise(c_n=n()) %>% 
    arrange(desc(c_n))
