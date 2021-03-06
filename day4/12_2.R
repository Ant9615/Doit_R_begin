library(dygraphs)
library(xts)

econ <- ggplot2::economics
head(econ)

#xts는 시간 순서 속성을 지니는 데이터 타입임
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)
dygraph(eco) #그래프 생성
dygraph(eco) %>% dyRangeSelector()#날짜범위 선택 가능

#여러값 표현 
View(economics)
str(economics)
eoc_a<-xts(economics$psavert, order.by = economics$date) #저축률
eoc_b<-xts(economics$unemploy/1000, order.by = economics$date) #실업자 수
eco_psun <- cbind(eoc_a,eoc_b)#데이터결합
colnames(eco_psun) <- c("psavert","unemploy") #변수명 변경
head(eco_psun)
dygraph(eco_psun)%>%dyRangeSelector()
