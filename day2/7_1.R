#결측값은 누락된 값, 비어있는 값을 의미한다.
library(dplyr)
library(ggplot2)
#결측치 찾기 
mv <- data.frame(factor=c("M","F",NA,"M","F"), #R에서 결측치 표시는 NA이다.
                 score=c(5,4,3,4,NA))
mv
#결측치 확인하기
is.na(mv) #결측치면 TURE, 아니면 FALSE로 반환한다
table(is.na(mv)) #결측치 빈도값 확인
table(is.na(mv$factor)) #성별에 대한 결측치 빈도값 반환 
table(is.na(mv$score)) #점수에 대한 결측치 빈도값 반환
mean(mv$score) #컬럼 내에 결측치가 있기에 NA값을 반환

#결측치 제거
#결측치를 제거하기 위해서 dplyr 패키지를 로드해야한다 
mv %>% filter(is.na(score)) #score가 NA인 데이터만 출력
mv %>% filter(!is.na(score)) #score 중 NA가 아닌 데이터만 출력(!is.na)
mv_1 <- mv%>% filter(!is.na(score)) #score 데이터 중 NA값을 제거한 프레임을 생성 
mv_1
mean(mv_1$score)
sum(mv_1$score)
#여러 변수 동시에 결측치를 제거한 데이터 추출 
mv_1 <- mv %>% filter(!is.na(score)&!is.na(factor))
mv_1

#결측치가 하나라도 있으면 제거 
mv_2 <- mv %>% na.omit(df) 
mv_2
"
 na.omit()은 결측치가 하나라도 있으면 제거하는 편리함이 있지만 분석에 필요한 행을 모두 제거하는 불편함이 있다. 
즉, 분석할 때 왜곡이 생긴다. 데이터 손실을 최소화하기 위해서 filter를 이용하자.
"
#결측치 제외 기능
"na.rm()을 TRUE로 설정하면 결측치를 제외하고 함수를 적용하기에 결측치 제거 작업에서시간적으로 절약이 된다. 하지만, 모든 함수가 na.rm()을 지원하는건 아니다. 안된다면 filter()를 이용하자" 
mean(mv$score, na.rm = T)
sum(mv$score, na.rm = T)

#기존 데이터에 NA값을 할당하고 요약통계량 산출하기 
na_ea <- read.csv("C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R/Data/csv_exam.csv")
na_ea[c(3,9,16), "english"] <- NA #대괄호는 데이터의 위치를 지칭하는 역할
na_ea %>% summarise(m_english = mean(english, na.rm = T), #평균값
                    s_math = sum(english, na.rm = T), #합계
                    med_math = median(english, na.rm = T), #중앙값
                    sd_math = sd(english, na.rm = T)) #sd는 표준편차 

#결측치 대체하기 
"결측치를 대체하는 여러 방법이 있다. 평균대치법, 단순확률대치법, 다중대치법, 표준화 
등이 있다. 그 중에 가장 쉬운 평균대치법을 이용하여 결측치를 대체해보자" 
mean(na_ea$english, na.rm = T)
na_ea <- ifelse(is.na(na_ea$english), 83, na_ea$english) 
table(is.na(na_aa$english))  #$ 오퍼레이터 오류남
mean(na_ea$english) #$ 오퍼레이터 오류남 

#혼자서 해보기
#Q1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hWy"] <- NA
table(is.na(mpg$hwy) & is.na(mpg$drv))

#Q2
mpg %>% 
    filter(!is.na(mpg$hwy)) %>% 
    group_by(mpg$drv) %>% 
    summarise(m_hwy = mean(mpg$hwy)) %>% 
    arrange(desc(m_hwy))
