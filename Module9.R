##Module 9: Multivariate Analysis: Tobacco Statistics from the CDC

#Libraries
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plyr)
library(stats)

#Read CSV file
smokedata <- read.csv("C:\\Users\\tyler\\Desktop\\Spring 2023\\Visual Analytics\\SmokeBan.csv")

#Omit numbering column
smokedata <- smokedata[,-1]
head(smokedata)

#Clean Column Names
colnames(smokedata) <- c("Smoker","Ban","Age","Education","African American","Hispanic","Gender")

#factor statement to differentiate every education level
smokedata$Education <- factor(smokedata$Education, labels = c("hs dropout","hs","somecollege","college","master"))

#Multivariate Visual
ggplot(smokedata, aes(Education, Age, color = Smoker)) +
  geom_boxplot() +
  labs(
    x = "Level Of Education",
    y = "Age"
  ) + ggtitle("Age versus Education in Smokers versus Non-Smokers")

#As we can see from the visual provided in the assignment, there are clear signs that smokers are more of a polarized character in academia.
## While results do place them at lower success rates in lower levels of education, they are neck and neck at the highest level.
# This group of people are more prone to being disciplined with smoking, or not, and choose to drink, smoke, party etc. causin your priorities to be neglected.
#The 5 elements of design are Alignment, Repetition, Contrast, Proximity, and Balance.
#By creating a clearly and contrast labeled plot, with color differences and clear axial notation, this demonstrates useage of the 5 design principles because I did end up remedying
#Some of the issues I encountered, by using these principles as a guiding hand.