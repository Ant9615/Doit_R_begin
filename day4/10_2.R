"워드클라우드를 생성해보자"

library(rJava)
library(memoise)
library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)
library(ggplot2)

#트위터 텍스트 마이닝
#데이터 불러오기
useNIADic()
twit <- read.csv("C:/Users/user/Desktop/work/study/data/Data/twitter.csv",
                 header = T,
                 stringsAsFactors = F,
                 fileEncoding = "utf-8")
extractNoun(twit)
# twit<-sapply(twit, extractNoun(twit[1]), USE.NAMES = F)
# twit_unlist<-unlist(twit)
# wordcount <- table(twit_unlist)
# head(wordcount)

#변수명 수정
twit <- rename(twit,
               no=번호,
               id=계정이름,
               date=작성일,
               tw=내용)

# #특수문자 제거
twit$tw <- str_replace_all(twit$tw, "\\W"," ")
head(twit$tw)

#단어 빈도표 생성
t_nouns <- extractNoun(twit$tw)
t_nouns
t_wordcount <- table(unlist(t_nouns))
t_word <- as.data.frame(t_wordcount, stringsAsFactors = F)
t_word<-rename(t_word,
               word=Var1,
               freq=Freq)
t_word <- filter(t_word, nchar(word)>=2)
top20<-t_word %>%
  arrange(desc(freq)) %>%
  head(20)
top20
