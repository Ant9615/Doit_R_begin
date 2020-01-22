#순서대로 정렬해보자 
#재탕 
df_ex %>% arrange(math) #수학점수를 기준으로 오름차순으로 정렬

df_ex %>% arrange(desc(math)) #수학점수를 기준으로 내림차순으로 정렬

df_ex %>% arrange(class, math) #반과 수학점수 기준으로 오름차순

#혼자 해보기 
#Q1
mpg_a
au_hwy <- mpg_a %>% filter(mpg_a$manufacturer=="audi")
head(au_hwy %>% arrange(desc(au_hwy$hwy)),5)
