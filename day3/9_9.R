library(dplyr)
library(ggplot2)
library(readxl)


#지역변수 검토 
class(welfare$code_region)
table(welfare$code_region)

#전처리 
#지역코드목록 생성
list_region <- data.frame(code_region=c(1:7),
                          region=c("서울",
                                   "수도권",
                                   "부울경",
                                   "대경권",
                                   "충남권",
                                   "강원충북권",
                                   "호남제주권"))
list_region
#지역명 변수 추가 
welfare <- left_join(welfare, list_region, id="code_region")
welfare %>% 
  select(code_region, region) %>% 
  head

#지역별 연령대 비율 분석 
#지역별 연령대 비율 만들기 
region_ageg <- welfare %>% 
  count(region, ageg) %>% 
  group_by(region) %>% 
  mutate(pct=round(n/sum(n)*100, 2))
region_ageg
ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip()

#노년층 비율 높은 순으로 막대 정렬하기 
#노년층 비율 내림차순으로 정렬
list_order_old <- region_ageg %>% 
  filter(ageg == "old") %>% 
  arrange(pct)
list_order_old

#지역명 순서 변수 생성
order <- list_order_old$region
order
ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits=order)

#연령대 순으로 막대색 나열
class(region_ageg$ageg)
levels(region_ageg$ageg)
#파라미터를 이용해서 순서 지정 
region_ageg$ageg <- factor(region_ageg$ageg,
                           levels = c("old","middle","young"))
class(region_ageg$ageg)
levels(region_ageg$ageg)
#그래프 생성
ggplot(data=region_ageg, aes(x=region, y=pct, fill=ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits=order)
