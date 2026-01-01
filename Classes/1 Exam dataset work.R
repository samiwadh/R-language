
?library


library(readr)

spine <- read.csv("spine_Dataset.csv")
Orange
# or 

spine = read.csv("spine_Dataset.csv")
#View(spine)
head(spine) # first 6 data
tail(spine)# last 6 data
nrow(spine) # number of row 
ncol(spine)# number of column
spine$pelvic_incidence # number of particular column
spine$pelvic_tilt.numeric  # number of particular column
spine$class  # number of particular column
summary(spine) # gives whole data set summary 
summary(spine$class)# give particular columns summary 
class(spine) # gives type of dataset
colnames(spine) # give the name of columns 
rownames(spine)# give the name of rows
dim(spine)# watching the dim
# change the dataset 
colnames(Orange)
Orange$Tree == 2 #logical vertor
# How can we select the rows in which Tree is equal to 2?
Orange[Orange$Tree==2,]
subset(Orange, Tree==2)# as an alternative we can write

# the subset function handles better missing values
# what if we want to select the rows where age is greater than 1300?
Orange[Orange$age > 1300,]
subset(Orange, age>1300)
# what if I want to select the rows where age is greater than 1300 and Tree is
# equal to 2?
subset(Orange, age>1300 & Tree==2)
# to select the first and third row
Orange[c(1,3),]
# to select the first two rows
Orange[1:2,]

# to get the element in the first row and third column
Orange[1,3]
# to select the second and third column
Orange[,2:3]
# to get the first three rows and the third column
Orange[1:3,3]
# we can select the second column in this way
Orange[,2]
Orange["age"]
# to get a new dataframe from Orange just with Tree and circumference
Orange[,c("Tree", "circumference")]
