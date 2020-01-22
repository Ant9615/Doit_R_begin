"
 막대 그래프는 데이터의 크기를 막대의 길이로 표현한 그래프이다. 
 성별 소득 차이처럼 집단 간 차이를 표현할 때 주로 사용한다.
"
library(ggplot2)
library(dplyr)

#집단별 평균표 생성 
#mpg데이터를 이용하여 구동 방식별 평균 고속도로 연비
mpg_hwy <- mpg_c %>%  #구동방식별 평균 고속도로 연비 
    group_by(drv) %>% 
    summarise(m_hwy=mean(hwy))
mpg_hwy

ggplot(data=mpg_hwy, aes(x=drv, y=m_hwy)) + geom_col() #막대그래프를 생성하기 위해 + geom_col()을 추가해준다 
#값의 크기 순으로 정렬 
"
 x변수에 reorder를 이용하여 막대를 값의 순으로 정렬한다. 
 정렬 기준을 삼을 변수 앞에 -를 붙이면 내림차순으로 정렬한다.
 (여기서는 정렬 기준 변수를 m_hwy로 한다. ) 
"
ggplot(data=mpg_hwy, aes(x=reorder(drv, -m_hwy), y=m_hwy)) + geom_col()

#빈도막대그래프 생성
"
 빈도막대 그래프는 값의 빈도로 막대의 길이를 표현한 그래프다.
 빈도막대 그래프는 +geom_col()이 아닌 +geom_bar()를 사용한다.
"
ggplot(data=mpg_c, aes(x=hwy)) + geom_bar()

"
+ geom_col()과 + geom_bar()의 차이는 요약표를 이용하는지 원자료를 이용하는지에 따라 그래프를 만드는 절차와 함수가 다르므로 유의하자. + geom_col()는 요약표를 + geom_bar()는 원자료를 사용하여 막대그래프를 그린다.
"

#혼자서 해보기
#Q1 
mpg_d <- mpg_c %>% 
    filter(class=="suv") %>% 
    group_by(manufacturer) %>% 
    summarise(m_cty = mean(cty)) %>% 
    arrange(desc(m_cty)) %>% 
    head(5)

ggplot(data=mpg_d, aes(x=reorder(manufacturer, -m_cty), y=m_cty)) + geom_col()

#Q2

ggplot(data=mpg_c, aes(x=class)) +geom_bar()

       