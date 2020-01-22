#데이터 파악
#데이터 파악
#재탕 
df_exam

#앞부분만 출력 만약 앞부분의 9번째까지 보고 싶으면 ,9 추가 
head(df_exam, 9)

#뒷부분만 출력 만약 뒷부분의 6번째까지 보고 싶으면 ,6 추가
tail(df_exam, 6)

#View() 이용해서 뷰어창에서 데이터 확인하기 
View(df_exam) #v는 대문자다!!

#몇 '행', '열'인지 확인
dim(df_exam) #dim은 차원이라는 뜻을 가진 dimension의 앞글자이다

#데이터의 속성 파악하기
str(df_exam)

#요약통계량 산출
#min(=최솟값)/1st Qu.(=1사분위수 (하위 25% 지점))/Median(=중앙값)/Mean(=평균)
#3st Qu.(=3사분위수 (하위 75% 지점))//max(=최댓값)
summary(df_exam)

#mpg데이터로 간단 분석
library(ggplot2) #mpg데이터를 부르기 위해 ggplot2 패키지 로드
mpg <- as.data.frame(ggplot2::mpg)  #데이터를 변수에 할당
head(mpg) #상위 6개 데이터
tail(mpg) #하위 6개 데이터
dim(mpg) #차원 행은 234 열은 11
str(mpg) #데이터 속성
summary(mpg) #요약통계량 산출