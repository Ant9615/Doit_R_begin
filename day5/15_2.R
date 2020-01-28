"
연속변수(numeric)
: 키, 몸무게, 소득 등 연속적이고 크기를 의미하는 값으로 구성된 변수, 숫자가 크기를 지니기에 산술이 가능하다. 양적변수라고도 한다.

범주형 변수(factor)
: 값이 대상을 분류하는 의미를 지니는 변수. 예로 성별변수는 남자는 1, 여자는 2로 각 범주를 분류함. 범주 변수는 숫자가 대상을 지칭하는 이름과 같은 역할을 하기에 명목변수(nomial variable)이라고도 함. 
"
library(ggplot2)

## 각 변수의 차이점을 알아보자 
var1 <- c(1,2,3,1,2) ##numeric변수
var2 <- factor(c(1,2,3,1,2)) ##factor 변수
var1
var2

##연산여부
var1+4
var2+3

##타입파악 
class(var1)
class(var2)

##구성범주 확인 
levels(var1)
levels(var2)

##문자로 구성된 변수 
var3 <- c("a","b","b","c")
var4 <- factor(c("a","b","b","c"))
var3
var4

##타입파악
class(var3)
class(var4)

##함수적용
sum(var1)
sum(var2)

##타입변경
var2 <- as.numeric(var2)
sum(var2)
class(var2)
levels(var2)


##혼자서 해보기 
##Q1 
mpg_15 <- as.data.frame(ggplot2::mpg)
class(mpg_15$drv)

##Q2
mpg_15$drv <- as.factor(mpg_15$drv)
class(mpg_15$drv)

##Q3
levels(mpg_15$drv)
