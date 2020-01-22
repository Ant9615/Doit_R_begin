#변수명을 바꿔보자 
#일단 변수명을 변경하기 위해서는 rename()이라는 함수를 써야하는데 dplyr패키지를 설치하고 로드하자 

install.packages("dplyr")
library(dplyr)

#두개의 변수가 있는 데이터프레임을 생성하자
df_a <- data.frame(f_1=c(1,2,3),
                   f_2=c(4,5,6))
df_a

#프레임 복사본 만들자
df_aa <- df_a
df_aa

#rename()을 이용해서 df_aa의 변수 하나를 바꿔보자 
df_aa<-rename(df_aa, c_2=f_2) #f_2를 c_2로 변경
df_aa
