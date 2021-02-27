##Basics of R
##Notes are taken from "R for Everyone: Advanced Analytics and Graphics" 
##Chapter 4
##by Jared P. Lander

##Basic Math

1 + 1

1 + 2 + 3

3 * 7 * 2

4/2

4/3

4 * 6 + 5

(4 * 6) + 5

4 * (6 + 5)

## Assigning Variables

x <- 2

y = 5

3 <- z
z

a <- b <- 7
a
b

assign("j", 4)
j

##Removing Variables

rm(j)
#now it's gone
j

#Variable names are case sensitive
theVariable <- 17

THEVARIABLE

##Data Types

#Numeric

class(x)

is.numeric(x)

#to set a number as an integar (whole number only) append with an L
i <-5L
i

is.integer(i)

is.numeric(i)

##R promotes integar to numeric when needed

class(4L)
class(2.8)
4L * 2.8
class(4L * 2.8)

#Example with division

class(5L)
class(2L)
5L/2L
class(5L/2L)

##Character Data

x <- "data"
x

y <- factor("data")
y

nchar(x)

nchar("hello")

nchar(3)

nchar(452)

#does not work for factor data

nchar(y)

##Dates

#Date stores date
#POSIXct stores data and time

date1 <- as.Date("2021-02-27")
date1

class(date1)

as.numeric(date1)

date2 <- as.POSIXct("2021-02-27")
date2

class(date2)

as.numeric(date2)

##lubridate and chron packages make manipulation of date and time objects easier

##Using fucntions such as as.numeric or as.Date does not just change formatting
##but also changes the underlying data type

class(date1)

class(as.numeric(date1))

##Logical
#TRUE is the same as 1
#FALSE is the same as 0

TRUE * 5

FALSE * 5

#is.logical function to test

k <- TRUE
class(k)

is.logical(k)

#T and F can be used as shortcuts, but it's better
#not to use them because they can easily be overwritten

T
class(T)

T <- 7
class(T)

#logicals can result from comparing two numbers or characters

2 == 3

2 != 3

2 < 3

2 <= 3

2 > 3

2 >= 3

"data" == "stats"

"data" < "stats"

##Vectors

#vectors cannot be of mixed data type
#vectors are not columns or rows, they don't have a dimension
#create a vector with a c for combine

x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x

x * 3

x + 2

x - 3

x/4

x^2

sqrt(x)

#Another way to create a vector is to use the : operator

1:10

10:1

-2:3

5:-7

#two vectors of equal length can be operated on together

x <- 1:10
y <- -5:4

x + y

x - y

x * y

x/y

x^y

length(x)

length(x + y)


##When adding vectors of different lengths, the shorter vector gets recycled

x + c(1, 2)

##If the longer one is not a multple of a shorter one, a warning is given

x + c(1, 2, 3)

##Comparisons work on vectors

x <= 5

x > y

x <- 10:1
y <- -4:5
any(x < y)
all(x < y)

#nchar function also acts on each element of a vector

q <- c("Hocky", "Football", "Baseball", "Curling", "Rugby", "Lacrosse",
       "Basketball", "Tennis", "Cricket", "Soccer")
nchar(q)

nchar(y)

##Accessing individual elements of a vector is done using square brackets ([])

x[1]

x[1:2]

##Retrieve nonconsecutive elements by using c
x[c(1, 4)]

#provide a name for each element of an array using a name-value pair
c(One = "a", Two = "y", Last = "r")

#create a vector
w <- 1:3

#name the elements
names(w) <- c("a", "b", "c")
w

## Factor Vectors

q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")

q2Factor <- as.factor(q2)
q2Factor

as.numeric(q2Factor)

factor(x=c("High School", "College", "Masters", "Doctorate"), 
levels=c("High School", "College", "Masters", "Doctorate"),
ordered=TRUE)

##Calling Functions

mean(x)

## Function Documentation

?mean

?'+'

?'*'

?'=='

##If you don't know the exact funciton name
apropos("mea")

## Missing Data

##NA for missing data

z <- c(1, 2, NA, 8, 3, NA, 3)
z

is.na(z)

##NULL

#NULL cannot exist within a vector

z <- c(1, NULL, 3)
z

d <- NULL
is.null(d)

is.null(7)

## LAB 1

## a)	Create a factor variable called days that contains the days of the week. 
## Your factor variable days should be ordered such that Sunday is the first day, 
## Monday is the second day, etc. 
## Levels correspond to the order of the days of the week. 
## Now test whether this variable is truly a factor or not? 

factor(days <-c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
                "Saturday"),
       levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
                "Saturday"),
       ordered=TRUE)
days

## b)	Create a vector of numbers from one to ten called num_vec. 
## Use the sum function to calculate the sum of this vector using both the 
## sum function directly applied to the vector, and the magrittr pipe command 
## to “pipe” the function to the vector. 

num_vec <- 1:10

sum(num_vec)

library(magrittr)

num_vec %>% sum