"
기술통계
: 데이터를 요약하여 설명하는 통계

추론통계
: 어떤 값이 발생할지 확률값을 계산하는 통계
-> 이때 유의확률을 사용하여 가설을 검정하는 것을 통계적 가설검정이라고 한다.  
"

"
t-test(t검정)
: 두 집단의 평균을 비교하는 것을 t-test라고 하고 세집단 이상을 비교할 때 F-test를 이용한다(분산비교). t-test의 차이가 유의하기 위해서는 차이 값이 커야하고, 표준편차가 작으며, 표본크기가 충분히 커야한다. 
: 유의값(P-value)rk 0.05보다 미만이면 집단 간 차이가 유의하다.
"
library(dplyr)
library(ggplot2)

#데이터 load
mpg<-as.data.frame(ggplot2::mpg)
#class, cty만 선택 후, class 변수 중 compact, suv만 남김
mpg_t <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))
head(mpg_t)
table(mpg_t$class)

#t-test
t.test(data=mpg_t, cty~class, var.equal=T)

#일반휘발유와 고급 휘발유의 도시연비 t검정
mpg_t2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r","p"))

table(mpg_t2)
t.test(data=mpg_t2, cty~fl, var.equal=T)
