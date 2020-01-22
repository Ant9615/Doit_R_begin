#데이터를 합쳐보자 
library(dplyr)
library(ggplot2)

#가로로 합치기
#2개 데이터 생성
md <- data.frame(id=c(1,2,3,4,5),
                 middle=c(70,50,84,23,64))
fe <- data.frame(id=c(1,2,3,4,5),
                 final=c(89,56,45,78,100))
md
fe
#dplyr의 내장함수인 left_join()을 이용하여 id기준(by=)으로 두 프레임을 결합
ex <- left_join(md, fe, by="id")
ex
#다른 데티어를 활용해 추가 
name<- data.frame(id=c(1,2,3,4,5),
                  stu=c("kim", "jang","jeong","lee","gu"))
name
ex_n <- left_join(ex, name, by="id") #새로운 변수에 합친 프레임을 생성
ex_n

#세로로 합치기 
#2개 변수 생성 
g_a <- data.frame(id=c(1,2,3,4,5),
                  t=c(55,68,89,45,15))
g_b <- data.frame(id=c(6,7,8,9),
                  t=c(48,41,100,96))

#dplyr의 내장함수인 bind_rows()를 이용하여 세로로 합칠 수 있다 
g_c <- bind_rows(g_a, g_b)
g_c

#혼자 해보기 
fuel <- data.frame(fl=c("c", "d", "e", "p", "r"),
                   fl_price=c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F) 
#stringsAsFactors = F는 factor타입으로 변환하지 않도록 설정하는 파라미터  
#Q1
mpg_c <- left_join(mpg, fuel, by="fl")

#Q2
mpg_c %>% 
    select(model,fl, fl_price) %>% 
    head(5)
