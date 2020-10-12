## Assignment 1
# basic exploratory analysis 

library(xlsx)
library(tidyverse)

traindata <- read.csv('train.csv',1)


View(traindata)
summary(traindata)


ggplot(traindata, aes(x=SalePrice)) +
  geom_histogram()



#correlation for numeric variables
x<- traindata$SalePrice
y<- select_if(traindata, is.numeric) %>% select(-SalePrice)

cor(x, y, use="complete.obs")



# boxplots for factor variables 
fact <- select_if(traindata, is.factor) %>% mutate(Id = traindata$Id, SalePrice = traindata$SalePrice)

fact_long<- fact %>% 
  gather("var", "val", MSZoning:SaleCondition) 

ggplot(fact_long, aes(x = val, y = SalePrice)) +
  geom_boxplot()+
  facet_wrap(~var) 



