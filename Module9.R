#Module 9: 3 Visualizations 
#Libraries
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plyr)
library(stats)

#import data .csv file

arrests <- read.csv("C:\\Users\\tyler\\Desktop\\Spring 2023\\Visual Analytics\\Arrests.csv")

str(arrests)
head(arrests)
  


#Visual 1 Boxplot
arrests$sex <- factor(arrests$sex, labels = c("Female","Male"))
arrests$year <- factor(arrests$year, labels = c("1997","1998","1999","2000","2001","2002"))
ggplot(arrests, aes(sex,age, color = colour)) +
  geom_boxplot()

#Visual 2 Histogram

ggplot(arrests, aes(checks)) +
  geom_histogram(
    binwidth = 0.5
  ) + labs(
    x = "Checks",
    y = "Number of Inmates with that number of Checks"
  )

#Visual 3 Scatterplot

ggplot(arrests, aes(year, age, color = sex)) +
  geom_point()

#Note I added this visual in to the assignment because finding data to use for making different visualizations
#Can be difficult. For one, there is no gurantee on having an abundance of sources that have more data that is variate rather than discrete
##Additionally, this scatter visual really did put into perspectives the rates of men and women being arrested for hte same series of crimes in  the same span of 5 years.

