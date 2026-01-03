# let us see how to categorize variables using R
sunspot.year

range(sunspot.year)# range min and max

(breaks=seq(from = 0 , to=200 ,by=25))

# we can categorize the continuous variable sunspot.year in this way 
cut(sunspot.year,breaks = breaks,inculde.lowest=TRUE)



# we have obtained right-closed intervals
# if we want left-closed intervals
cut(sunspot.year, breaks=breaks, include.lowest=TRUE,right = FALSE)

# let us give a name to this categorized variable
spots = cut(sunspot.year, breaks=breaks, include.lowest=TRUE)
# we can get the frequency distribution using the table function
table(spots)


# we have obtained the absolute frequencies
# it is perhaps convenient to convert it to a dataframe
(freq= as.data.frame(table(spots)))

# we can change the name of the second column
names(freq)[2] <- "abs.freq"
freq


# we can compute the relative frequencies
freq$rel.freq = freq$abs.freq/sum(freq$abs.freq)
freq

sum(freq$rel.freq) # of course they sum up to one


# we can compute the relative frequencies also in this way
freq$rel.freq = proportions(freq$abs.freq)
freq

# how can we compute the absolute cumulative frequencies?
freq$cum.freq = cumsum(freq$abs.freq)
freq$relcum.freq = cumsum(freq$rel.freq)
freq


# for instance, 226 is the number of observations that are smaller than or
# equal to 75 and they are the 78.2% of all observations
# let us consider another dataframe named iris
iris

summary(iris)
head(iris)
colnames(iris)
ncol(iris)
nrow((iris))
dim(iris)
summary(iris$Sepal.Length)

#The code summarizes Sepal.Length, groups it into length intervals using cut(), 
# and counts observations in each interval using table()
iris$sepl.int =cut(iris$Sepal.Length,breaks=4:8)
table(iris$sepl.int)


# using table we can also create a contingency table between
# the categorized variable and species
table(iris$Species, iris$sepl.int)


# we can obtain another representation for this table in this way
data.frame(table(iris$Species, iris$sepl.int))

# how to add a row to a dataframe?
tail(Orange)

# we can add a row in this way
Orange.new2 = rbind(Orange, c(4,1000, 100))
tail(Orange.new2)

# indexes
(x=runif(30))


sum(x-mean(x))
# how can we get mean 
mean(Orange$age)


# let us create a vector w sampling with replacement 30 numbers
# between 1 and 4
(w=sample(1:4, size=30, replace=TRUE))


weighted.mean(x, w) # to compute the weighted mean


# this is equivalent to
sum(x*w)/sum(w)

# how to compute the mean with missing values?
(x=c(10, NA, 5, -6, NA))

# we can ask R to compute the mean excluding missing values
mean(x, na.rm=TRUE)



set.seed(100) # to fix the seed generating the pseudo-random numbers
(x=runif(10))

# since the length of x is even, this is equivalent to
mean(sort(x)[5:6])

# to get quartiles togehter with min and max
quantile(x, type=2)


# R considers 9 ways to compute quantiles and we refer to type 2
# to get just the quartiles
quantile(x, type=2, probs= c(1/4,1/2,3/4))


# as an exercise you can try to compute quartiles applying directly the definition
# variance
var(x) # sample variance equivalent to


# as an exercise you can try to compute quartiles applying directly the definition
# variance
var(x) # sample variance equivalent to


# to compute the population variance
var(x)*(length(x)-1)/length(x)


sd(x) # sample standard deviation
?sd


# it is equivalent to
sqrt(var(x))

(y=runif(10)) # another vector y of the same length as x


cov(x,y) # sample covariance

# OR 
sum((x-mean(x))*(y-mean(y)))/(length(x)-1)

cor(x,y) # correlation coefficient



# the pipe operator |> pipes (moves) what is written on the left-hand side (LHS)
# of the pipe into the first argument of the function on the right-hand side (RHS)
# of the pipe
# another example: instead of writing
round(pi, 3)

# we can write
pi |> round(3)

# it was added a place holder
# for instance instead of
round(pi, 1:4)

# we can write
1:4 |> round(pi, digits=_)


# another recent novelty is the new syntax for anonymous functions
# instead of writing
f = function(x){x^2} # to create the square function
f(2)

# we can write
f = (\(x) x^2)
f(2)

plot(function(x){x^2}, -1,1)
# OR

plot(\(x) x^2, -1,1)


# let us see how tho save the plot:
pdf("plot.pdf")
plot(\(x) x^2, -1,1)
dev.off()


# Introduction to the package collection "Tidyverse" -----
# to install the package: install.packages("tidyverse")
# In R you can use a function given by a package using ::
# for instance to use the function "filter" given by the "dplyr" package
# (which is part of tidyverse) you
dplyr::filter(Orange, Tree==1)


# the function "filter" is equivalent of "subset"
# as an alternative you can load the library
library(tidyverse)
# the pipe operator %>% is very similar ro the native equivalent |>
1:3 %>% mean # it does not require round parenthesis as the native equivalent

1:3 |> mean()


# for the tidyverse pipe %>% the place holder is "."
2:4 %>% round(pi,.)


# this is equivalent to
2:4 |> round(pi, digits = _)


# with the native pipe operator the placeholder needs to be named
# install.packages("gapminder")
library(gapminder)
# we have loaded the library gapminder cotaning a data frame named gapminder
gapminder