##Module # 7 Visual Analytics Assignment
library(dplyr)
library(tidyverse)
library(ggplot2)
## Step 1: Load the dataset. I will be using the built in 'mtcars' dataset

data(mtcars)
mtcars

## Step 2: Let's generate some visuals. If we wanted to visualize the mpg compared to the engines layout, we can use ggplot
## to better visualize. Remember to use factor() so that ggplot knows to seperate each visual to each value and the range of outputs

ggplot(mtcars, aes(x = factor(mtcars$cyl), y = mtcars$mpg)) +
  geom_boxplot(fill = "red")

##Let's try something new, how about visualizing whether or not that the displacement and quarter mile times (qsec) are related
## We might see instances of the old "power to weight ratio" concept on some of these cars. Some of the models, like Lincoln, Mercedes
## and Hornet tend to be heavier, but with a larger engine. Some of the other brands like Datsun(Nissan) are lighter with boosted engines that are smaller

ggplot(mtcars, aes(x = factor(mtcars$cyl), y = mtcars$qsec)) +
  geom_boxplot(fill = "blue")

##Note: I had to use theme() to rotate the axial increments on the x axis because it looked pretty weird before but not anymore.

ggplot(mtcars, aes(x = factor(mtcars$disp), y = mtcars$qsec)) +
  geom_boxplot(fill = "green") +
  theme(axis.text.x = element_text(angle = 90))

##Let's try something new, how about some histograms and piecharts?
# This is a histogram on how many cars of speed gearbox there are
#binwidth is going to be set at 1, and "color" will be black to define a better visual aesthetic
ggplot(mtcars, aes(x = mtcars$gear)) +
  geom_histogram(fill = "aquamarine", color = "black", binwidth = 1)

##Setting the binwidth is essential to accurately displying data
#Note how my histograms values are centered on the x-axis increment, so that there are equal sized and ammounts of spaces that constitute for zero values

ggplot(mtcars, aes(x = mtcars$mpg)) +
  geom_histogram(fill = "blue", color = "black", binwidth = 1)


#You can also visualize using slightly different function calls to achieve the same effect. Earlier I called for a histogram about cylinder count, now I will call a barchart

ggplot(mtcars, aes(x = factor(mtcars$cyl))) +
  geom_bar(fill = "red", color = "black")

#You can even add lines and points to pre-existing visuals to add more information in one place.

##These are some basic visuals with ggplot, now lets introduce some Distribution Analysis concepts to these visuals
#Edit and clean the visual and its text.
#Lets recall histogram of fuel and edit using labs() with is in ggplot2

ggplot(mtcars, aes(x = mtcars$mpg)) +
  geom_histogram(fill = "blue", color = "black", binwidth = 1) +
  labs(
    title = "Number of Cars per measure of Fuel Economy in MPG",
    x = "Fuel Economy in MPG",
    y = "Number of Cars",
  )

#Now that the chart is cleaned, lets add a distribution line or whats regarded as a kernel density curve in ggplot, to the visual
##ggplot(mtcars, aes(x = mtcars$mpg)) +
##  geom_histogram(fill = "blue", color = "black", binwidth = 1) +
##  labs(
##    title = "Number of Cars per measure of Fuel Economy in MPG",
##    x = "Fuel Economy in MPG",
##    y = "Number of Cars") 
#Above is the histogram we will use, it is commented out so we can build the distribustion curve.

ggplot(mtcars, aes(x = mtcars$mpg)) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1,
                 color = "black",
                 fill = "blue") +
  geom_density(alpha = 0.1)

#For fun, we can add a dashed mean line to better visualize this density distribution
ggplot(mtcars, aes(x = mtcars$mpg)) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1,
                 color = "black",
                 fill = "blue") +
  geom_density(alpha = 0.1) +
  geom_vline(aes(xintercept=mean(mtcars$mpg, na.rm = TRUE)),
             color = "black",
             linetype = "dashed",
             size = 1.1)
## And dont forget some labels!!
ggplot(mtcars, aes(x = mtcars$mpg)) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 1,
                 color = "black",
                 fill = "blue") +
  labs(
    title = "Fuel Mileage Distribution",
    x = "Fuel Economy in MPG",
    y = "Density of Sample members in the Kernel Density Dist.",
  ) +
  geom_density(alpha = 0.1) +
  geom_vline(aes(xintercept=mean(mtcars$mpg, na.rm = TRUE)),
             color = "black",
             linetype = "dashed",
             size = 1.1)
##As we can see from the completed visual, the fuel economy in MPG is on the x-axis and the relative density is on the y-axis
#It is important to remember that when conducting visualizations such as this which is a kind of overlay. that the y axis will change
# to the density rather than the count of the ammount of cars per MPG. The mean is around 20 MPG with more members of the sample
#being located below the mean, causing a positive skew and distribution that is more dense, and heavily populated on the low end

#How could this be? Lets do the same for the engine type and find out 
ggplot(mtcars, aes(x = mtcars$disp)) +
  geom_histogram(aes(y = after_stat(density)),
                 binwidth = 20,
                 color = "black",
                 fill = "blue") +
  labs(
    title = "Engine Displacement Distribution",
    x = "Engine Displacement",
    y = "Density of Sample members in the Kernel Density Dist.",
  ) +
  geom_density(alpha = 0.1) +
  geom_vline(aes(xintercept=mean(mtcars$disp, na.rm = TRUE)),
             color = "black",
             linetype = "dashed",
             size = 1.1)
##It can be shown in this distribution that, possible reasons for there being more cars of a higher fuel consumption would be because 
#Of the high average displacement of the engine. The mean is about 230 CI which is quite large and would have an average mpg of around 25-27 in real life
#But it is because of having more high fuel consuming vehichles in the data, that the distribution is skewed to have a density centered lower.
#In the Displacement Distribution, you will notice that a large portion of vehichles over the mean are well over 350 CI or 5.7 Litres
#Engines like that tend to produce about 8-13 MPG in the city and 20 max on the highway on a cold day with cruise control.
#Some inferential thought is required here to be able to make sense of why having data distributed in certain places may create differences in the end result, and these inferences
#Might lie outside of the realm of R or Statistics.


