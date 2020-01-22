library(dplyr)
library(ggplot2)

#각 행마다 과목 점수를 합산한와 평균 변수 추가
df_exam %>% 
    mutate(sum=math+english+science,
           mean=sum/3) %>% 
    head(5)

#ifelse() 이용 
df_exam %>% 
    mutate(test=ifelse(math>=60, "Pass", "False")) %>%  #수학점수가 60점 이상일 때 pass 이외는 false
    head(3) 

#arrange() 이용
df_exam %>%
    select(class, math, english, science) %>% 
    mutate(sum=math+english+science,
           mean=sum/3) %>%
    arrange(mean) %>% #오름차순으로 정렬 
    head

#혼자서 해보기 
#Q1
mpg_b <- mpg %>% 
    select(manufacturer, hwy, cty) %>% 
    mutate(HCT=hwy+cty)

#Q2
mpg_b %>% select(manufacturer, hwy, cty) %>% 
    mutate(HCT=hwy+cty,
           HCM=HCT/2) %>% 
    arrange(desc(HCM)) %>% 
    head(3)

#Q3
mpg %>% select(manufacturer, hwy, cty) %>% 
    mutate(HCT=hwy+cty,
           HCM=HCT/2) %>% 
    arrange(desc(HCM)) %>% 
    head(3)
