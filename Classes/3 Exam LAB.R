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

# PAGE 5
