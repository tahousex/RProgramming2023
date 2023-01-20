#Module 2 Homework Assignment LIS4370
#First we will assign the dataset provided entitled "assignment2"
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
#Then, we will call the function myMean, that has been predesigned for our use
myMean <- function(assignment2) { return(sum(assignment2)/length(assignment2)) }
#Now, we will test the function two ways, first we will call the function to analyze the data set
#Then, we will break down the function of deriving a mean into seperate lines of code to ensure its accuracy
myMean(assignment2)
#CONSOLE OUTPUT = 19.25
#Now, lets identify the length and sum of the data set and break it down by assigning objects 'a and b'
length(assignment2) -> a
sum(assignment2) -> b
#Now we can test the a and b variables for an average by calculating b divided by a
b/a
#As we can see, the function "myMean" is viable and perfectly functional
## The length() shows how many numerical objects are in the data 
## and the sum() tells us exactly that, a sum.
