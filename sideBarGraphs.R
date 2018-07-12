# Sideways Bar Graph (Simple One)

# References:
# http://rstudio-pubs-static.s3.amazonaws.com/7433_4537ea5073dc4162950abb715f513469.html
# R Graphics Cookbook by Winston Chang (2012)


# Load packages:

library(ggplot2)

# Favourite Colour Survey (Made-Up/Fake Data):

colour_choices <- c("Blue", "Red", "Green", "White", "Black", "Orange", 
                    "Purple", "Pink", "Yellow", "Brown")

colour_counts <- c(35, 26, 33, 19, 20, 15, 12, 24, 30, 29)

colour_table <- data.frame(colour_choices, colour_counts)

# Preview table:

colour_table

# Check data structure:

str(colour_table)

# Rename columns:

colnames(colour_table) <- c("Colour", "Count")

# Total Number in Survey:

(total_num <- sum(colour_table[, 2]))


##--------------------------------------------------

## ggplot bar Graph:

ggplot(data = colour_table, aes(x = Colour, y = Count)) +
  geom_bar(stat = "identity", width = 0.75) +
  labs(x = "\n Colour Choice", y = "Count \n", title = "Favourite Colours Survey Results \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="red", size = 12),
        axis.title.y = element_text(face="bold", colour="red", size = 12))

## Sideways Bar Graph (Add coord_flip())

ggplot(data = colour_table, aes(x = Colour, y = Count)) +
  geom_bar(stat = "identity", width = 0.75) +
  coord_flip() +
  labs(x = "\n Colour Choice \n", y = "\n Count \n", title = "Favourite Colours Survey Results \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="red", size = 12),
        axis.title.y = element_text(face="bold", colour="red", size = 12))

##----------------

## Colours are in ABC order, not in order as defined in the beginning. Some fixes needed.

# Fix first column:

colour_table$Colour <- factor(colour_table$Colour, levels = colour_choices)

## Sideways Bar Graph Reattempt (Colours from bottom to top)

ggplot(data = colour_table, aes(x = Colour, y = Count)) +
  geom_bar(stat = "identity", width = 0.75) +
  coord_flip() +
  labs(x = "\n Colour Choice \n", y = "\n Count \n", title = "Favourite Colours Survey Results \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="red", size = 12),
        axis.title.y = element_text(face="bold", colour="red", size = 12))

##----------------

## Sorting the colours from most popular to least popular sideways bar graph:

# We fix it by using the factor function again but with a modification.
# Reference: http://rstudio-pubs-static.s3.amazonaws.com/7433_4537ea5073dc4162950abb715f513469.html
# order(colour_table$Count) puts the row numbers from smallest to largest:

colour_table$Colour <- factor(colour_table$Colour, 
                              levels = colour_table$Colour[order(colour_table$Count)])

ggplot(data = colour_table, aes(x = Colour, y = Count)) +
  geom_bar(stat = "identity", width = 0.75) +
  coord_flip() +
  labs(x = "\n Colour Choice \n", y = "Count \n", title = "Favourite Colours Survey Results \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="red", size = 12),
        axis.title.y = element_text(face="bold", colour="red", size = 12))


## Adding labels (Add geom_text()):

ggplot(data = colour_table, aes(x = Colour, y = Count)) +
  geom_bar(stat = "identity", width = 0.75) +
  coord_flip() +
  geom_text(aes(label = Count), hjust = 1.2, colour = "white", fontface = "bold") +
  labs(x = "\n Colour Choice \n", y = "\n Count \n", title = "\n Favourite Colours Survey Results \n") +
  theme(plot.title = element_text(hjust = 0.5, size = 15), 
        axis.title.x = element_text(face="bold", colour="red", size = 12),
        axis.title.y = element_text(face="bold", colour="red", size = 12))

