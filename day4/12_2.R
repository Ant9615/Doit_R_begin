library(dygraphs)
library(xts)

econ <- ggplot2::economics
head(econ)

eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)
dygraph(eco) #그래프 생성
dygraph(eco) %>% dyRangeSelector()#날짜범위 선택 가능

#여러값 표현 
View(economics)
str(economics)
eoc_a<-xts(economics$psavert, order.by = economics$date)
eoc_b<-xts(economics$unemploy, order.by = economics$date)
eco_psun <- cbind(eoc_a,eoc_b)#데이터결합
colnames(eco_psun) <- c("psavert","unemploy") #변수명 변경
head(eco_psun)
dygraph(eco_psun)%>%dyRangeSelector()
