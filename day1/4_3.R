#외부파일을 불러오기 전에 일단 엑셀 패키지부터 설치하고 로드하자
install.packages("readxl")
library(readxl)

#데이터를 변수에 할당
df_exam <- read_excel("C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R/Data/excel_exam.xlsx")
df_exam

#분석 
mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

#첫 번째 행이 변수명이 아니라면 
df_exam_noheader <- read_excel("C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R/Data/excel_exam_novar.xlsx", col_names = F)
df_exam_noheader

#시트가 여러개일 때 
df_exam_sheet <- read_excel("C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R/Data/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

#csv파일 
#내장함수 이용, 변수명이 없을 때는 'header=F' 입력
#파일에 문자가 들어있는 경우 stringAsFactors=F 추가
df_exam_csv <- read.csv("C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R/Data/csv_exam.csv")
df_exam_csv

#저장
#df_gpa재탕하여 csv로 저장 
write.csv(df_gpa, file = "C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R_begin/day1/df_gpa.csv")
#RData로 저장
save(df_gpa, file = "C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R_begin/day1/df_gpa.RData")
#RData 불러오기
rm(df_gpa) 
#RData불러오기 
load("C:/Users/STUDENT/Desktop/dotitRstudy/Doit_R_begin/day1/df_gpa.RData")
df_gpa

#할당
#excel은 변수명<-read_excel("경로/파일명.xlsx")
#csv는 변수명<-read.csv("경로/파일명.csv")
#RData불러오기는 load("경로/파일명.RData") 