library(dplyr)
library(ggplot2)

" 
 ggplot2 패키지의 문법은 3단계의 레이어 구조로 되어있다. 1단계는 배경을 설정하고, 2단계 1단계에서 만든 배경 위에 그래프를 추가하고, 3단계는 2단계에서 축 범위, 색, 표식 등 설정을 추가하는 형식이다.
                            배경설정 -> 그래프 추가 -> 옵션
"

mpg_c <- as.data.frame(ggplot2::mpg)

#산점도
"
: 산점도는  데이터를 x축과 y축에 점으로 표현한 그래프다. 나이와 소득처럼 연속 값으로 된 두 변수의 관계를 표현할 때 사용한다.
"

#1단계 
ggplot(data=mpg_c, aes(x=displ, y=hwy)) #x축을 배기량, y축을 고속도로 연비

#2단계
ggplot(data=mpg_c, aes(x=displ, y=hwy)) + geom_point() # +기호를 이용하여 그래프의 유형 추가 

#3단계
#축범위 조정하는 옵션추가
"
 축은 기본적으로 최솟값에서 최댓값까지 모든 범위의 데이터가 표현되도록 설정되어 있다
하지만, 데이터 전체가 아니라 일부만 표현을 하고 싶을 때 축범위를 설정 할 수 있다
"
#x축 범위를 3~6으로 지정  
ggplot(data=mpg_c, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6)
#x축범위를 3~6, y축 범위를 10~30으로 지정
ggplot(data=mpg_c, aes(x=displ, y=hwy)) +  #데이터 축
    geom_point() +  #그래프 종류
    xlim(3,6) + #옵션
    ylim(10,30) 

#혼자 해보기 
#Q1
ggplot(data=mpg_c, aes(x=cty, y=hwy)) + geom_point()

#Q2
midw <- as.data.frame(ggplot2::midwest)
ggplot(data=midw , aes(x=poptotal, y=popasian)) + 
    geom_point() +
    xlim(0,500000) +
    ylim(0,10000)
