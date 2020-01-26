library(KoNLP)
library(dplyr)
library(stringr)

#사전 설정하기 
useNIADic()

#데이터 불러오기 
txt<- readline("C:/Users/user/Desktop/work/study/data/Data/hiphop.txt")
txt<-str_replace_all(txt, "\\W", " ")

#명사추출 
nons<-extractNoun(txt)
wordcount <- table(unlist(nons))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

#변수명 수정 
df_word<- rename(df_word,
                 word=Var1,
                 freq=Freq)

df_word <- filter(df_word, nchar(word)>=2)
top10 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(10)
top10
