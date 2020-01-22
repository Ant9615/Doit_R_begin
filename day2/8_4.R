"
 선 그래프는 데이터를 선으로 표현한 그래프다. 
 시간에 따라 달라지는 데이터인 시계열데이터를 표현할 때 많이 쓰인다. 
"
library(ggplot2)

#시계열 그래프 생성
"ggplot2의 economics데이터를 이용하여 x축을 시간, y축을 실업자 수로 지정하고
+geom_line()을 이용하여 시계열 그래프를 생성해보자
"
eco <- as.data.frame(ggplot2::economics)
ggplot(data=eco, aes(x=date, y=unemploy)) + geom_line()

#혼자 해보기 
#Q1 
ggplot(data = eco, aes(x=date, y=psavert)) + geom_line()
