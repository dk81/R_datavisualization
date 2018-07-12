# Line Plots In R
# Reference: R Graphics Cookbook by Winston Chang (2012)

library(MASS) # Dataset library
library(ggplot2) # Data visualization

# Belgium Phone Calls Data:

belgium_phonecalls <- data.frame(phones)

# Preview the data:

head(belgium_phonecalls); tail(belgium_phonecalls)

# Add 1900 to the year column:

belgium_phonecalls[, 1] <- 1900 + belgium_phonecalls[, 1]

# Rename column names:

colnames(belgium_phonecalls) <- c("Year", "Number_Calls")

# Preview the data again:

head(belgium_phonecalls); tail(belgium_phonecalls)

#------------------------

## Simple Line Plot:

plot <- ggplot(belgium_phonecalls, aes(x = Year, y = Number_Calls)) 

plot + geom_line()

#------------------------

## Adding dots with the line:

plot + geom_line() + geom_point()

## Coloured dots and coloured line:

plot + geom_line(colour = "darkgreen") + 
  geom_point(colour = "blue", shape = 21, size = 3, fill = "blue")

## A polished line plot with labels:

plot + geom_line(colour = "darkgreen") + 
  geom_point(colour = "blue", shape = 21, size = 3, fill = "blue") +
  labs(x = "\n Year \n", y = "Number Of Calls (Millions) \n", 
       title = "Belgian Phone Calls Data (1950 - 1973) \n") + 
  theme(plot.title = element_text(hjust = 0.5, colour = "brown"), 
        axis.title.x = element_text(face="bold", size = 12),
        axis.title.y = element_text(face="bold", size = 12),
        axis.text.x = element_text(vjust = 0.2),
        legend.title = element_text(face="bold", size = 10)) 


