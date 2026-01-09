mar = gss_data
head(mar)

nrow(mar)
ncol(mar)

sum(is.na(mar$tvhours))

mean(mar$tvhours,na.rm = TRUE)

mean(mar$tvhours[mar$marital == "Never married"],na.rm = TRUE)
mean(mar$tvhours[mar$marital == "Divorced"],na.rm = TRUE)

length(unique(mar$denom))

piz = pizza
head(piz)

# Compare times between two types of restaurants
t_result <- t.test(time ~ restaurant, data = piz)
t_result

#This is asking about the absolute value of a test statistic in R — 
#usually from a t-test, z-test, or similar hypothesis test.
abs(t_result$statistic)



t_result <- t.test(time ~ restaurant, data = piz)

# Degrees of freedom
t_result$parameter

t.test(time ~ restaurant, data = piz, conf.level = 0.97)$conf.int

