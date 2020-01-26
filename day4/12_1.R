library(plotly)
library(ggplot2)

#ggplot2패키지를 이용하여 그래프 만들기 
#mpg데이터 이용해서 만들기 
graph1 <- ggplot(data = mpg, aes(x=displ, y=hwy, col=drv)) + 
  geom_point() 
ggplotly(graph1) #인터렉티브 그래프 생성

#인터렉티브 막대 그래프 만들기
graph2 <- ggplot(data=diamonds, aes(x=cut, fill=clarity)) +
  geom_bar(position = "dodge")
ggplotly(graph2)
