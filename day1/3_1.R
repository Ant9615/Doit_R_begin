#변수를 만들어 보자
a<-1 # 변수 a를 만들어 1을 집어놓고
a # a는?

#여러 값으로 구성된 변수 만들기
b<-c(1,2,3,4,5)
b

#콜론을 이용해서 1씩 증가 하면서 연속된 숫자 만들기
c<-c(1:6) #1에서 6까지
c

#seq()를 이용하여 연속 값을 지닌 변수 만들기
d<-seq(1,8)#1에서 8까지
d

#by 파라미터를 이용하여 일정 간격을 둔 연속된 숫자 출력
#파라미터는 함수에 특정 기능을 설정하는 옵션임
e<-seq(1,9, by=3) #1에서 9까지 3 간격으로
e

#변수 연산
b+1

b+e #서로 element의 개수가 안맞은 것으로 연산하면 결과는 나오지만 경고메시지가 나옴

#문자로 된 변수 생성
f <- "a" #문자로 된 변수를 지정할 땐 큰 따옴표 필수! 
f

#단어 또는 여러 단어로 구성된 변수를 생성해보자 
g <- "april"
g

h <- "Hello World!"
h
print("Hello World!") #그리고 하나 더(초보 코더들의 국룰을 넘어선 세계적인 룰 

#c()이용해서 문자로 구성된 변수 추가 
i <- c("a", "b","c")
i

j <- c("coding", "is", "fun!", "sorry", "...")
j

#참고로 문자로 구성된 변수는 연산이 불가능하다
j+1
i+j