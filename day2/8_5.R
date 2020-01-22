"
상자그림은 데이터의 분포를 상자 모양으로 표현한 그래프다. 앞서 공부했듯이 outlier를 찾을 때 유용하다. 상자그림하면 4분위수를 빼놓을 수 없는데 앞에 언급을 했으므로 pass하자.
"
library(ggplot2)
library(dplyr)

mpg_e <- mpg
"앞에서는 내장함수 boxplot()을 이용했지만 이번엔 ggplot2 내장함수 + geom_boxplot()를 이용해서 상자그림을 생성해보자."
#drv별 hwy 상자그림 생성
ggplot(data=mpg_e, aes(x=drv, y=hwy)) + geom_boxplot()

#혼자서 해보기 
#Q1 
mpg_class <-mpg_e %>% 
            filter(class=="compact" | class=="subcompact" | class=="suv") 
ggplot(data=mpg_class, aes(x=class, y=cty)) + geom_boxplot()
