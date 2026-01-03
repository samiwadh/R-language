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
