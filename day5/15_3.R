library(ggplot2)

"
vector
: 하나의 값 또는 여러 개의 값으로 구성된 데이터 구조이다. 여러 변수 타입을 섞을 수없고, 한 가지 타입으로만 구성할 수 있다.

"
a<-1
a

b<-"hello"
b

## 데이터구조 파악
class(a)
class(b)

"
Data frame
: 행과 열로 구성된 2차원 데이터 구조이다. 다양한 변수 타입으로 구성할 수 있다

"
x <- data.frame(v1=c(1,2,3),
                v2=c("a","b","c"))
x
class(x)

"
matrix
: 데이터 프레임과 마찬가지로 행과 열로 구성된 2차원 구조이지만, 한가지 변수 타입으로만 구성이 가능함
"
y <- matrix(c(1:12), ncol=2) #1부터 12까지 열은 2개로 생성
y
class(y)

"
array
: 2차원 이상으로 구성된 매트릭스이며, 한 가지의 변수타입으로만 구성이 가능함
"
z<-array(1:20, dim = c(2,5,2)) #1~20으로 2행 5열 2차원 
z
class(z)

"
list
: 모든 데이터 구조를 포함하는 데이터 구조이며, 여러 데이터 구조를 합하여 하나의 리스트로 만들 수 있다.
"
L <- list(f1=a,
          f2=x,
          f3=y,
          f4=z)
L
class(L)

## ggplot2 패키지 내장 데이터를 이용한 데이터 추출 
mpg_s <- as.data.frame(ggplot2::mpg)
x <- boxplot(mpg_s$cty)
x #list 구조임

x$stats[,1] #요약통계량 추출
x$stats[,1][3] #중앙값 추출 
x$stats[,1][2] #1분위 수 추출
