#데이터 분석은 함수를 이용해서 함수로 끝난다.
#함수의 간단한 예를 들자면 필자는 산업공학도이니까 산업공학도스러운 이야기를 하자면
#input(row material, row data, 석연&나무) -> process(function, 연필생산공정) -> output(연필)
#이런 식이다 그럼 함수에 대해서 알아보자

x<-c(1111,3453,7657) #일단 x라는 변수에 아무 숫자 3개를 선언해보자
x

#평균값 계산
(x[1]+x[2]+x[3])/3 #원래는 이거인데 함수를 쓰면
mean(x) #완벽깔끔!

#최대값과 최소값을 구해보자
max(x) #최대값(maximum)
min(x) #최소값(minimum)

#문자를 다루는 함수 
#3-1에서 생성한 j변수를 재탕하자
j
#paste()를 이용하여 합쳐보자
paste(j, collapse = ' ') 
#collape는 요소들을 구분해주는 파라미터로 나는 빈칸으로 구분 지었다 

#응용(변수선언 및 출력)
mean_x <- mean(x)
mean_x
paste_j <- paste(j, collapse = ' ')
paste_j
