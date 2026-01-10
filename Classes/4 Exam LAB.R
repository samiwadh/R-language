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
library(readr)
some_data_sk_kurt <- read_csv("Dataset setwed directory/some_data_sk_kurt.csv")
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


country_codes


#how to merge two dataframes or tibbles?
#In base R we have the function "merge"
#In dplyr we have several similar functions
#one of themis"left_join"
left_join(gapminder,country_codes)

#in this way we have added to the tibble gapminder
#the columns of country_codes
#this is done automatically on the basis of the variables
#that the two dataframes have incommon(in this case"continent")
#all the rows of the first dataframe(gapminder)are kept but not all
#the rows of the second dataframe(countrycodes)
#this is equivalent to

left_join(gapminder,country_codes,by = "country")


#similar functions are right_join,full_join,inner_join
#what if we need to merge two dataframes with respect to columns with differen
#names?
(df1=tibble(x=1:3))
(df2=tibble(w=c(1,1,2),y=c("first","second","third")))
left_join(df1,df2,by=join_by(x==w))
#How to verify Gaussianity---

library(readr)
data_normal <- read_csv("Dataset setwed directory\\dati_normal.csv")
head(dati_normal)


ggplot(data=data_normal,aes(sample=X))+
  stat_qq()+stat_qq_line()+facet_wrap(~pop)
#in this plot we are comparing the sample quarantines with the theoretical quantiles
#of the Gaussian distribution
#if the points are close the line then the data can be regardedas realizations
#of a Gaussian distribution
#we can see that for population B we have gaussianity but not for
#population A and C
#as an alternative one can use Shapiro test
#for which the null hypothesis is that the generating population is gaussian



#in general,givena null hypothesis,the aim of a statistical test is to verify
#if there is enough evidence int he sample to reject the null hypothesis
#to this aim a p-value is computed and the null hypothesis is rejected if the pvalue
#is small
#generally,the null hypothesis is rejected if the pvalue is smaller than0.05
#for instance,we just consider population A
data_normal|>filter(pop=="A")|>pull(X)|>shapiro.test()



#for pop.A we can reject the null hypothesis that the population is Gaussian
#to testall three populations
data_normal|>group_by(pop)|>
summarize(shapiro.pvalue=shapiro.test(X)$p.value|>round(4))



#to test all three populations
data_normal|>group_by(pop)|>
  summarize(shapiro.pvalue=shapiro.test(X)$p.value|>round(4))



## Confidence interval for the mean----
n=60 #sample size
true.mean=100
data=rnorm(n,true.mean,5)
#we can obtain a point estimator for the population mean
#considering the sample mean
mean(data)



pa 12