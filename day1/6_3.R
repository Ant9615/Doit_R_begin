library(dplyr)
library(ggplot2)

#수학점수만 추출 
df_ex %>% select(math)

#여러변수 추출
df_ex %>% select(class, math, english)

#변수 제외 
df_ex %>% select(-math)
df_ex %>% select(-math, -english)

#dplyr 함수조합
#1반인 행 중에 영어점수 추출 
df_ex %>% 
    filter(class==1) %>% 
    select(english)
#id, math 추출하고 5행까지만 추출
df_ex %>% 
    select(id,math) %>% 
    head(5)

