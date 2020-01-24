library(dplyr)
library(ggplot2)
library(foreign)

#지역변수 이상치 확인
table(welfare$code_region)
boxplot(welfare$code_region) #none

#지역변수 이름 부여 
welfare$code_region <- ifelse(welfare$code_region == 1, "seoul",
                              ifelse(welfare$code_region == 2, "c_area",
                                     ifelse(welfare$code_region == 3, "pk",
                                            ifelse(welfare$code_region == 4, "tk",
                                                   ifelse(welfare$code_region==5, "cn",
                                                          ifelse(welfare$code_region==6, "gang/cb", "honam/jeju"))))))
qplot(welfare$code_region)

#경상소득 검토 및 전처리 
class(welfare$c_income)
summary(welfare$c_income)
boxplot(welfare$c_income)
#이렇게 된 이상 변수 정규화된 데이터 변수를 생성하자
welfare<-welfare %>% 
  mutate(
    c_income_normalize=scale(c_income, center = TRUE, scale = TRUE)
  )
summary(welfare$c_income_normalize)

#0이하값을 이상치로 하고 다시 해보자 

welfare$c_income_normalize <- ifelse(welfare$c_income_normalize<0, NA, welfare$c_income_normalize)

region_c_income <- welfare %>%
  filter(!is.na(c_income_normalize)) %>% 
  group_by(code_region) %>% 
  summarise(m_income=mean(c_income_normalize))
region_c_income
ggplot(data = region_c_income, aes(x=code_region, y=m_income)) +geom_col()
