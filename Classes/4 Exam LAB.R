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


d=some_data_sk_kurt

#Letuscomputemean,sd,skewness,andkurtosisforeachvariable
#install.packages("moments")
library(moments)
reframe(d,across(everything(),
                 \(x) c(mean(x), sd(x), skewness(x), kurtosis(x)))) |>
  round(3) |> bind_cols(stat=c("mean","sd","skewness", "kurtosis"),x=_)


# we can obtain the same result in other ways
# let us create a new tibble with pivot_longer
(d_longer = d |>
    pivot_longer(everything(), names_to = "pop", values_to="value"))


# the function pivot_wider does the opposite transformation of dataframes
# pivot_wider and pivot_longer are similar to the native functions stack()
# and unstack()
# at this stage we can obtain what we have obtained with reframe()
# in this other way
d_longer |> group_by(pop) |>
  summarize(mean=mean(value), sd=sd(value), skewness=skewness(value),
            kurtosis=kurtosis(value)) |>
  map_df(\(x) if (is.character(x)) x else round(x,3))


dev.new()
ggplot(d_longer)+
  geom_histogram(aes(x=value,y=after_stat(density)),bins=20)+
  facet_wrap(~pop,scales="free")
#X1 is approximately symmetric
#X2 has a right tail(positive skewness)
#X3 has a left tail(negative skewness)
#X4 has heavy tails(excess of kurtosis)
#X5 has thinner tails(kurtosis<3)
##merging dataframes---
gapminder



page 8