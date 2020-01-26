library(ggiraphExtra)
library(tibble)
library(ggplot2)
library(maps)
library(mapproj)

#미국 주별 범죄 데이터 준비 
str(USArrests)
View(USArrests)
head(USArrests)

#지도 데이터 준비 
crime <- rownames_to_column(USArrests, var = "state") 
crime$state <- tolower(crime$state)
str(crime)

#단계구분도 생성
state_map <- map_data("state")
str(state_map)
#인터렉티브 단계구분도 생성
ggChoropleth(data = crime,
             aes(fill=Murder,
                 map_id = state),
             map=state_map,
             interactive = T)

