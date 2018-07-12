# Histograms in R

# The Dataset: Time on Facebook

# There is no additional information about the dataset. Only the .csv
# file was provided.
# There are two columns of class and time.
# I would think/guess that the times are in minutes.

# References:
# 
# Dataset: 'http://sites.williams.edu/bklingen/files/2015/07/timeFB.csv'
# http://docs.ggplot2.org/0.9.3.1/geom_histogram.html
# http://zevross.com/blog/2014/08/04/beautiful-plotting-in-r-a-ggplot2-cheatsheet-3/

# The url link of the dataset in .csv format:

url = 'http://sites.williams.edu/bklingen/files/2015/07/timeFB.csv'

#Load data:

facebook_time <- read.csv(url, header = TRUE)

# A look at the data:

head(facebook_time)
str(facebook_time)
summary(facebook_time)

# The times are in the second column

fb_time <- facebook_time[, 2]

# Users who spend no time on facebook:

no_fb <- sum(fb_time == 0); no_fb

# Percentage/Proportion out of 1597 observations:

no_fb / 1597

# Users less than 30 minutes:

less30_fb <- sum(fb_time < 30); less30_fb; less30_fb / 1597

# Users from at least 30 minutes to an hour (non - inclusive):

fb_30_hour <- sum(fb_time >= 30 & fb_time < 60); fb_30_hour;  fb_30_hour / 1597

# At least an hour on facebook:

hourplus_fb <- sum(fb_time >= 60); hourplus_fb; hourplus_fb / 1597

#-------------------------------------

# Histograms

#-------------------------------------

# Base R Package Historgram:

hist(fb_time, xlab = "Time Spent on Facebook (Min.)", ylab = "Number of Facebook Users",
     main = 'Facebook Activity', ylim = c(0, 1100))


# ggvis Histogram plots:

library(ggvis)
library(dplyr)

facebook_time %>% ggvis(~fb_time) %>% layer_histograms() %>%
  add_axis("x", title = "Time Spent on Facebook (Min.)", title_offset = 50) %>%
  add_axis("y", title = "Number of Facebook Users", title_offset = 50)


# ggplot2 qplot:

library(ggplot2)

qplot(fb_time, data = facebook_time, geom="histogram", binwidth = 50)

# ggplot2 histogram plots:

ggplot(facebook_time, aes(fb_time)) + geom_histogram(binwidth = 50) + 
  labs(x="Time Spent on Facebook (Min.)", y= "Number of Facebook Users") +
  theme(axis.text.x=element_text(angle=50, size=10, vjust=0.5)) 

# Adding colour outline of the bars (col = "green"):

ggplot(facebook_time, aes(fb_time)) + geom_histogram(binwidth = 50, col = "green") + 
  labs(x="Time Spent on Facebook (Min.)", y= "Number of Facebook Users") +
  theme(axis.text.x=element_text(angle=50, size=10, vjust=0.5)) 

# Adding colour of the bars (fill = "blue"):

ggplot(facebook_time, aes(fb_time)) + geom_histogram(binwidth = 50, fill = "blue") + 
  labs(x="Time Spent on Facebook (Min.)", y= "Number of Facebook Users") +
  theme(axis.text.x=element_text(angle=50, size=10, vjust=0.5)) 

# Making the bars lighter (alpha = 0.5):

ggplot(facebook_time, aes(fb_time)) + geom_histogram(binwidth = 50, fill = "blue", alpha = 0.5) + 
  labs(x="Time Spent on Facebook (Min.)", y= "Number of Facebook Users") +
  theme(axis.text.x=element_text(angle=50, size=10, vjust=0.5)) 

# ggplot2 histogram plots with density (y = ..density..):

#ggplot(facebook_time, aes(fb_time)) + 
 # geom_histogram(binwidth = 50, fill = "blue", alpha = 0.2, aes(y = ..density..)) +
  #  geom_density() +
   # labs(x="Time Spent on Facebook (Min.)", y= "Number of Facebook Users") +
    #theme(axis.text.x=element_text(angle=50, size=10, vjust=0.5))
