# Advanced Bar Plot In R:

library(faraway) # Dataset package
library(ggplot2) # Data visualization

suicide_data <- suicide

# Preview data:
head(suicide_data); tail(suicide_data)

# Check structure of data:

str(suicide_data)

# y is the count of the number of students with given hair eye/combo

# Rename columns:

colnames(suicide_data) <- c("Count", "Cause", "Age", "Sex")

# Bar Plot (x axis for Cause, y axis for Counts, colours for Age):

ggplot(suicide_data, aes(x = Cause, y = Count, fill = Age)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "\n Cause Of Death", y = "Count \n", fill = "Age Group \n",
       title = "Suicide Method Data From The UK Results \n") +
  scale_x_discrete(labels = c("Drug", "Gas", "Gun", "Hang", "Jump", "Other")) +
  scale_fill_discrete(labels=c("Middle Aged", "Old", "Young")) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        axis.text.x = element_text(angle = 90, vjust = 0.2, hjust = 1),
        legend.title = element_text(face="bold", size = 10))

#-----------------


# Bar Plot (x axis for Cause, y axis for Counts, colours for Age) By Gender
# Reference: http://stackoverflow.com/questions/3472980/ggplot-how-to-change-facet-labels

facet_plot <- ggplot(suicide_data, aes(x = Cause, y = Count, fill = Age)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "\n Cause Of Death", y = "Count \n", fill = "Age Group \n",
       title = "Suicide Method Data From The UK By Gender \n") +
  scale_x_discrete(labels = c("Drug", "Gas", "Gun", "Hang", "Jump", "Other")) +
  scale_fill_discrete(labels=c("Middle Aged", "Old", "Young")) +
  facet_grid(. ~ Sex) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        axis.text.x = element_text(angle = 90,vjust = 0.2, hjust = 1),
        legend.title = element_text(face="bold", size = 10),  
        strip.background = element_rect(fill="lightgreen", colour="black", size=1),
        strip.text = element_text(face="bold", size=rel(1.2)))

# Call facet plot:

facet_plot

#-----------

# Fixing the titles in the green background:
# This changes the f and m to Female and Male respectively.

# http://stackoverflow.com/questions/3472980/ggplot-how-to-change-facet-labels

genders <- list('f'="Female", 'm'="Male")

gender_labeller <- function(variable, value){
  return(genders[value])
  }
  
# Fixed facet plot:
  
facet_plot + facet_grid(. ~ Sex, labeller = gender_labeller)