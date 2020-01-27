library(rJava)
library(memoise)
library(KoNLP)
library(dplyr)
library(stringr)



#사전 설정하기 
useNIADic()

#데이터 불러오기
h_txt<- readLines(file("C:/Users/user/Desktop/work/study/data/Data/hiphop.txt"), encoding="EUC-KR")
#특수문자 제거
h_txt<-str_replace_all(h_txt, "\\W", " ")
#명사추출
nouns <- extractNoun(h_txt)
warning(nouns)
#추출한 명사 리스트를 벡터로 전환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))
#데이터 프레임으로 전환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word
#변수명 수정 
df_word<- rename(df_word,
                 word=Var1,
                 freq=Freq)
#두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word)>=2)
#상위 10 단어 빈도표 추출 
top10 <- df_word %>% 
  arrange(desc(freq)) %>%  
  head(10)
top10

 