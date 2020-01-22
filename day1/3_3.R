#패키지는 여러 관련함수가 들어있는 종합선물 세트 같은 역할을 한다.
install.packages("ggplot2")
library(ggplot2)

#ggplot2 라이브러리 함수를 사용하여 ggplot2 라이브러리를 맛보자
y<-c("a","a","a","b","b","c")
qplot(y) #막대그래프 생성!

#ggplot2의 내장 데이터로 mpg 그래프 만들기 
#고속도로 연비별 빈도 막대그래프
qplot(data=mpg, x=hwy)

#코드를 바꿔가며 코드 실행
qplot(data=mpg, x=cty)
qplot(data=mpg, x=drv, y=hwy) # x축 drv, y축 hwy

#선그래프 형태
qplot(data=mpg, x=drv, y=hwy, geom="line")
#상자그림 형태
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")
#drv별로 색표현
qplot(data=mpg, x=drv, y=hwy, geom="boxplot", color=drv)

#혼자해보기 
#Q1
exam <- c(80,60,70,50,90)
exam
#Q2 
mean(exam)
#Q3
e_mean <- mean(exam) 
e_mean
