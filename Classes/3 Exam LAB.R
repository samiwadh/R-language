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
