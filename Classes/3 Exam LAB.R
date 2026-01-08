library(tidyverse)
library(gapminder)
count(gapminder)
# or
gapminder|> summarize(n=n())

dim(gapminder)
summary(gapminder)

nrow(gapminder)
count(gapminder,continent)
# OR
count(x=gapminder, continents=continent)
# Or 
gapminder|>group_by(continent)|> summarize(n=n)

tot<-summary(gapminder$continent)
tot


# recall how to control rounding with tibbles (important for the exam)
options(pillar.sigfig=7)
# to compute the population of each continent in 2007
gapminder |> filter(year==2007) |>
  group_by(continent) |> summarize(pop=sum(pop/10^6))

# Or 

gapminder |> filter(year==2007)|>count(continent,wt=pop/10^6)



#let us find the four countries with the highest total gpd in 2007

colnames(gapminder)

highest = 
  gapminder|>filter(year== 2007)|>
  mutate(tot_gdp = gdpPercap*pop/10^9)|>
  arrange(desc(tot_gdp))|>
  filter(row_number()<=4)|>
  pull(country)|>as.character()
highest


#thisisequivalent
biggest_countries=
  gapminder |>filter(year==2007)|>
  mutate(tot_gdp=gdpPercap*pop/10^9)|>
  arrange(desc(tot_gdp))|>slice(1:4)|>
  pull(country)|>as.character()
biggest_countries

#considering this list(where countries are ordered according to gdpPercap in 2007)
#what is the position of Italy?

ITALY = gapminder |> 
  filter(year == 2007) |> 
  arrange(desc(gdpPercap)) |> 
  mutate(position = 1:n()) |> 
  filter(country == "Italy")
ITALY

# OR 
# another alternative
df = gapminder |> filter(year==2007) |>
  arrange(desc(gdpPercap))
which(df$country=="Italy")


# as an alternative
gapminder |> filter(year==2007) |>
  mutate(position=row_number(desc(gdpPercap))) |>
  filter(country=="Italy")


# if we want to verify which country has the 24th position
gapminder |> filter(year==2007) |>
  arrange(desc(gdpPercap))|> filter(row_number()==24)


#or
gapminder |> filter(year==2007) |>
  arrange(desc(gdpPercap))|> slice(24)

# categorization of continuous variables
# we have seen the function "cut" in base R
breaks = seq(from=0, to=200, by=25)
cut(sunspot.year, breaks=breaks, include.lowest = TRUE) |>
  head()


# using base R we can get the frequency distribution using table
cut(sunspot.year, breaks=breaks, include.lowest = TRUE) |>
  table()

# alternative for above code 

cut_width(sunspot.year,25,boundary=0)|>head()

#one can obtain the freq.distr.of the categorized variableas follows
sunspot.cat=cut_width(sunspot.year,25,boundary=0)
tibble(sunspot.cat)|>
  count(sunspot.cat)


#we have obtained the absolute frequencies
#we can add there lative frequencies
tibble(sunspot.cat)|>count(sunspot.cat)|>
  mutate(f= proportions(n))

#wecanverifyiftherel.freq.sumuptoone
tibble(sunspot.cat)|>count(sunspot.cat)|>
  mutate(f= proportions(n))|>
  summarise(s=sum(f))

# let us consider a random vector containing letters
set.seed(100)
(x = sample(letters, size=30, replace = TRUE))

# how many different values are there in x?
unique(x) |> length()

# or we do in this way
factor(x) |> nlevels()

# or we can use a dplyr function
n_distinct(x)

setwd("D:\\1 Univesrity work\\Lect\\Statistics\\R-language\\Dataset setwed directory")
weather <- read_csv("weather_data.csv")
weather
# Or
library(readr)
weather_data <- read_csv("~/Dataset setwed directory/weather_data.csv")
head(weather_data,3)
dim(weather_data)
nrow(weather_data)
head(student)


# as an alternative you can use "Import Datasets" in the top right panel
# in RStudio and choose the second option which is "From text (readr)"
# How to count the number of different values in Events excluding missing values?
# with base R
na.omit(weather$Events) |> unique() |> length()
#Use na.omit() when you want to ignore missing values

#or 
#with dplyr
n_distinct(weather$Events,na.rm=TRUE) # na.rm stands for “remove NA”.


#let us consider a tibble containing missing values
(df=tibble(x=c(1,2,NA,2,1,3),y=c(2,NA,1,3,2,4)))


#Use is.na() when you want to detect or analyze missing values
is.na(weather$Events) |> unique() |> length()

#we can remove the rows containing missing values in this way
na.omit(df)


#or in this way (using dplyr function)
drop_na(df)

#let us consider a tibble with random numbers between zero and one
(df = tibble (x =runif(6),y=runif(6),z=runif(6)))

# how to compute the mean of x, y, z for each row using tidyverse?
# one could be tempted to write
df |> mutate(m=mean(c(x,y,z)))

# in this way we have obtained in each row
mean(c(df$x, df$y, df$z))

# as an alternative
df |> rowwise() |> mutate(m=mean(c_across(everything())))


# using the native R function apply:
df$m = apply(df, 1, mean)
df

# if instead we want to compute the mean of each variable/column
apply(df,2, mean)

# as an alternative in dplyr we can do as follows
df |> summarise_all(mean)

# let us consider some list
(l <- list(0:2, 1:2,-1:1))


# suppose that we want to apply a function (e.g. exp)
# to every element of the list to obtain a new list
# we can use "lapply", which is an R native function
lapply(l, exp)

# an equivalent function (map) is given in the package "purrr"
# which belongs to tidyverse
map(l, exp)

# if we want to apply the square function
map(l, \(x) x^2)


# we have used the new anonymous function syntax in base R
# this is equivalent to
map(l, ~.x^2) # using the old tidyverse syntax for anonymous functions

# of course the following is the same
map(l, function(x){x^2})


# with "map" we can extract the second element from each element of the list
map(l, 2)


# if we want to add 3 to every element of the list
map(l, `+`, 3)

# if we want to compute the mean of each variable in the df tibble
# we can do in this way
map(df, mean)

# we have obtained a list, if we want a vector
map(df, mean)|> unlist()


# map_dbl returns a double vector instead of a list
# map, map_dbl are similar to lapply and sapply
# there are other similar functions that
# map_lgl, map_int, map_chr, map_df
# to obtain a logical, integer, character vector or a tibble
# the followings are equivalent:
(1:10)^2

sapply(1:10, \(x) x^2)
map_dbl(1:10, \(x) x^2)
map_int(1:10, \(x) x^2)


# Graphics with ggplot2---
dir() # to see the content of the working directory

head(dati_normal)


getwd() # to see what is the working directory

load("nycflights.RData")
# let us do an histogram of the variable dep_delay
ggplot(data=nycflights) +
  geom_histogram(aes(x=dep_delay))


ggplot(data=nycflights) +
  geom_histogram(aes(x=dep_delay), binwidth = 15)


#these are not the correct histograms since the height of the bars are
#the absolute frequencies
#if we want the breaks to be-25,0,25,...,1500
#intervals closed to the left and the densities(correcthistogram)
ggplot(data=nycflights)+
  geom_histogram(aes(x=dep_delay,y=after_stat(density)),
                 breaks=seq(-25,1500,by=25),closed="left")


#scatterplot
gapminder2007=gapminder|>filter(year==2007)
(scatterplot=ggplot(gapminder2007)+
    geom_point(mapping=aes(x=gdpPercap,y=lifeExp)))

# we can add the regression line 
scatterplot +
  geom_smooth(aes(x=gdpPercap, y=lifeExp), method=lm, se=FALSE)


# by default se=TRUE and we obtain the confidence band
scatterplot +
  geom_smooth(aes(x=gdpPercap, y=lifeExp), method=lm)
