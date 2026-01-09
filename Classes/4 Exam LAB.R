#Anexamplewiththedplyrpackage---
library(tidyverse)
library(gapminder)


#recall how to set rounding (important for the exam)
options(pillar.sigfig=8)

#let us find the four countries with the highest total gdp in 2007
biggest_countries=gapminder|>filter(year==2007)|>
  mutate(tot_gdp=gdpPercap*pop/10^9)|>
  arrange(desc(tot_gdp))|>slice(1:4)|>pull(country)|>
  as.character()


#if we want to get a table with total gdp and percent age of the gdp(wrt world gdp)
#for these four countries and the rest of the world(for the year 2007)
gapminder|>filter(year==2007)|>
  mutate(country=ifelse(country%in% biggest_countries,as.character(country),
                        "RestoftheWorld"))|>
  mutate(country=factor(country,levels=c(biggest_countries,"RestoftheWorld")))|>
  group_by(country)|>
  summarize(tot_gdp=sum(gdpPercap*pop/10^9))|>
  mutate(perc_gdp=tot_gdp*100/sum(tot_gdp))


#More about ggplot2---
gapminder2007=gapminder|>filter(year==2007)
#let us consider the gdpPercapfor each continentin2007
(by_continent=gapminder2007|>
    group_by(continent)|>
    summarize(gdpPercap=weighted.mean(gdpPercap,pop)))

#geom_col() creates a barplot where the heights of the bars are given
#by a quantitative variable y where as x is acategorical variable
ggplot(by_continent)+geom_col(aes(x=continent,y=gdpPercap))


#we can flip the plot
ggplot(by_continent)+geom_col(aes(x=continent,y=gdpPercap))+
  coord_flip()



# how can we order the variable continent wrt gdpPercap?
ggplot(by_continent)+
  geom_col(aes(x=fct_reorder(continent, gdpPercap), y=gdpPercap))+
  coord_flip()+xlab("continent")


# geom_bar() creates a barplot where the heights of the bars
# are the absolute frequencies of a categorical variable
gapminder2007 |> ggplot()+
  geom_bar(aes(continent))


# how to order the variable continent wrt its frequency?
gapminder2007 |> ggplot()+
  geom_bar(aes(fct_infreq(continent)))+ xlab("continent")


#how to save a plot made with ggplot2 in the working directory?
ggsave("new_plot.pdf")