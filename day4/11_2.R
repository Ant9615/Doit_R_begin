library(kormaps2014)
library(dplyr)
library(tibble)
library(ggplot2)
library(maps)
library(mapproj)
library(ggiraphExtra)
devtools::install_github("cardiomoon/kormaps2014")

str(changeCode(korpop1))
head(changeCode(korpop1))
View(changeCode(korpop1))

korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

#한국 시도별 인구 단계 구분도 생성
str(changeCode(kormap1))
options(encoding = "UTF-8") #한글파일이라 깨지므로  인코딩 

ggChoropleth(data=korpop1, #데이터
             aes(fill=pop, #색으로 표현할 변수
                 map_id=code, #지역 기준
                 tooltip=name), #표시할 지역명
             map=kormap1, #지도 데이터
             interactive=T) #인터렉티브 여부

#대한민국 시도별 결핵 환자 수 단계 구분도 생성
str(changeCode(tbc))
ggChoropleth(data=tbc,
             aes(fill=NewPts, 
                 map_id=code, 
                 tooltip=name), 
             map=kormap1, 
             interactive=T) 
