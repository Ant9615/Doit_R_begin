#변수 생성
#생산관리
Mm <- c(3.5,3.0,2.0,4.5)
Mm

#경영과학
OR <- c(4.5,3.5,2.5,1.0)
OR

#통계적 품질관리
SQC <- c(4.0,3.0,3.5,3.0)
SQC

#데이터 프레임 생성
df_gpa <- data.frame(Mm, OR, SQC)
df_gpa

#학생 분반에 대한 정보가 추가된 프레임
class <- c("A", "B", "A", "B")
df_gpa <- data.frame(Mm, OR, SQC, class)
df_gpa

#분석하기 
#mean(df_gpa)하면 '경고메시지(들): In mean.default(df_gpa) 인자가 수치형 또는 논리형이 아니므로 NA를 반환합니다'라고 뜬다
mean(df_gpa$Mm) 
mean(df_gpa$OR)
mean(df_gpa$SQC)

#한번에 만들기
df_gpa <- data.frame(Mm=c(3.5,3.0,2.0,4.5),
                     OR=c(4.5,3.5,2.5,1.0),
                     SQC=c(4.0,3.0,3.5,3.0),
                     class=c("A", "B", "A", "B"))
df_gpa

#혼자서 해보기 
#Q1 
sales_chart <- data.frame(product=c("사과", "딸기","수박"),
                          price=c(1800,1500,3000),
                          sales=c(24,38,13))
sales_chart

#Q2
mean(sales_chart$price)
mean(sales_chart$sales)
