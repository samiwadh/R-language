4+4


# this is commit 
2*4^2

#we can see that from very large or very small numbers R uses Scientific notation
format(2*10^6) 



format(2*10^6, scientific = FALSE)


12/0           # we can get infinite as a result

log(0) # we can also get infinite as a result 

sqrt(-3) # Nan Stands for "not a number"

sqrt(3)


?round # "?" this is for finding documentation of any model,function

round(110.123456, 3)

# this is equivalent to
round(x=10.123456,digit= 3)


"statistics"  # this is a string of characters

# below is single comma and still same result as a string with two comma

'statistics'

log(1)        # log is natural logarithm

exp(1)          # exponential function

pi


                # create a variable and assign value to it 
x<-12
x


y<-8 
y

#sum of two variable values
z=x+y
z



                            # remove the object 
rm(x) # remove the object 
try(x) # finding the object 
# result Error in eval(ei, envir) : object 'x' not found



                  # line 35 si equivalent to
x = 10 # "=" is equivalent to "<-" and means assignment
x

try(x)


          # Same thing happend if we do 23->x or 23<-x or 23 = x
23->x
x


#if you want to create an object and display it immediately
# you can use round parenthesis
(x<- 30)


# this is equivalent to
x<-30; x # ; is equivalent to going to new line 


x*2
# or 
2*x

# let us see how to create a function 

?`function-class`  # watching the documentation of function class
func <- function(x){exp(1/x^2)}
func(10)

# same result without function and assign values directly 
exp(1/10^2)

plot(func, 0.1,0.105) # to plot the function in the interval [0.1,0.105]



 # logic operations



3>4
4>1
4>=3
4<=3

3 == 4 # double equality is used to verify equality
4 == 4

3 != 4 # "!=" means "different from"

4 != 4 # "!=" means "different from"


TRUE != FALSE

"ciao" != "hi"
"ciao" < "hi" # R considers the alphabetical order



!(2>3) #"!" means negation


# | means logic union
# you get TRUE if at least one of the two statement is TRUE
(2>3)|(3<4)

# it is equivalent to
any(2>3,3<4)

# & means logic intersection
# you get TRUE if both statements are TRUE
(2>3)&(3<4)


# it is equivalent to
all(2>3,3<4)

# function "c" (concatenate)
(x= c(4,7,9))

(y=c(14,10))

c(x,y) # you can concatenate tow vectors together

c(y,x)

# numeric sequences
3:23

24:10 # from 24 to 10 all numbers


(x=1:6)# it define the range of numbers from 1 to 6 

 
x + 4 # to add 4 to each elements of x which had value 1:6 and 4 will add each elemets


x/4 # to divide by 4 each element of x which had value 1:6 and 4 will divide each elemets

x^2 # to get the square of the each element which had value 1:6 and 4 will square each elemets

sqrt(x) # the function is applied element-wise

abs(x) # absolute value

exp(x);log(x)  # ;new line  

?exp # watching the exponetial doccuments 


# summing up two vectors of different lengths
# the shortest one is recycled
1:3 + 1:6

1:4 + 1:6 # this yields a warning

sum(x) # to sum all elements of the vector "x" which had value 1:6 it will some 1 2 3 4 5 6

prod(x) # to get the product which had value 1:6 it will some 1 2 3 4 5 6

max(x) # to get the maximum which had value 1:6 it will some 1 2 3 4 5 6

min(x) # to get the minimum  which had value 1:6 it will some 1 2 3 4 5 6

range(x) # to get min and max together
length(x) # to get the length of the vector


# how can we compute the mean of the elements of x 
sum(x)/length(x)

# but we can use directly the mean function
mean(x)

# to get the sequence of numbers between 0 and 1 equally spaced by 0.02
seq(0,1,by=0.2)

# or you can fix the number of (equally spaced) numbers that you want to obtain
seq(0,1,length.out=20)

seq(0,1,length.out=10)

cumsum(x) # cumulative sum
?cumsum # # watching the cumulative sum doccuments 

# to get the second element of x
x[2]


(x <- runif(20)) # to create a vector with 20 pseudo-random numbers between 0 and 1x
(x<- runif(50))

cumsum(x)[length(x)]

# the inverse operation of cumsum is diff
x= c(4,5,3)
diff(x) # takes the difference between each element and the previous element

1 %in% x # to verify if 1 belongs to x

4 %in% x

5 %in% x

# we have two menthod with "=" or "<-"
# method 1 
x = 1:4
y = c(1,2,13,40)
y %in% x

# method 2 
x <- 1:4
y <- c(1,2,13,40)
y %in% x


 # to sort the elements of a vector
sort(c(2,4,1,0,7,5,3,6))

# sort inverse 
sort(c(2,4,1,0,7,5,3,6),decreasing = TRUE)


unique(c(1,2,1,1,1,3,4,3,3)) # to get the unique values of a vector


# which() gives you the position of the elements of a vector satisfying a certain condition
x = c(0,3,2)
which(x<=3 & x>=2)

# which() gives you the position of the elements of a vector satisfying a certain condition
x = c(0,1,4,5,6,3,9,7,10,2)
which(x<=7& x>=1)


rep(1:3,2) # for repeating a vector



x= 1:1000
head(x)

tail(x)
##

# start with page 10 lecture 1 


# ecdf(x): computes the Empirical Cumulative Distribution Function (ECDF)
# It returns a function F(t) = proportion of observations in x that are ≤ t
# Used to estimate the distribution of a sample without assuming any model
# Example: ecdf(x)(2) gives P(X ≤ 2) based on the data

x = c(1,1,1,2,2,3,5,5)
ecdf(x) # this yields the empirical cumulative distribution function
?ecdf

ecdf(x)(2)


# this is the proportion of elements of the vector x
# that are smaller than or equal to 2
# therefore line 187 is equivalent to
sum(x<=2)/length(x)

x= c(1,2,3)
plot(ecdf(x), main = "Empirical cumulative distribution Function")


# in R there are four types of vectors
(x=c(TRUE, FALSE)) # logical vector


(y=c(1L, 6L,10L)) # integer vector

(w=c(1,2.5,-4.5)) # double

(z=c("aa","ab")) # character strings vector


typeof(x)
typeof(y)
typeof(w)
typeof(z)

#all elements of a vector must be of the same type
# otherwise you get coercion in this direction
# characther <- double <- integer <- logical
# for instance
c(TRUE,10)

x = c(8.1,9.1,4.3,4.2)
x


#index for finding value 

x[1]
#or 
x[[1]]
x[3]

# finding multiple value through indexing 
x[1:4]

# Concant function 

x[c(1,4)]

# to select all elements of x that are greater than 5
x[x>5]


# NA means "not available" and refers to missing values
(x=c(1,NA,2))

(x = c(8.1,6.2,4.3))



# we can substitute elements of a vector

x[3] = 4 # equivalent to: x[3]<-4
x

# lists are generalizations of vectors where each element can be anything
(l1 <- list(1:3,"a",c(TRUE,FALSE,TRUE),c(2.3,5.3)))

l1[[3]]
# OR
l1[3]
l1[c(1,3)]


# a vector can be converted into a list
(alist = as.list(1:3))


# or viceversa a list can be converted into a vector
unlist(alist)

# R objects can be given attributes, for instance dim
(z<-1:6)

# WE HAVE TO METHOD TO CALL MATRIC 
dim(z)<- c(3,2) # in this way z becomes a matrix
z
?dim


 
# we obtain the same if we write
z <- matrix(1:6, nrow=3, ncol=2)
z

# if we want to create the matrix rowwise
(z <- matrix(1:6, nrow=3, ncol=2, byrow=TRUE))


# NOW we are going to Indexing on matrix 
z[1,2]
z[1:3]
z[2:3]
# if we want to select the second column
z[,2]
z[1,]

# to obtain a submatrix given by the first and third row
z[c(1,3),]

# to obtain the submatrix given by the second column
z[,2, drop=FALSE]

# vectors can be named
(x=1:3)
