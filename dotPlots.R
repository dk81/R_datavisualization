# Dot Plots In R

library(faraway)
library(ggplot2)

# The butterfat data:
butterfat_data <- butterfat

# Preview the data:

head(butterfat_data)

tail(butterfat_data)

# Check data structure:

str(butterfat_data)

#---------------------

#ggplot Dot Plot

ggplot(butterfat_data, aes(x = Breed, y = Butterfat)) +
  geom_point(size = 1.5, aes(colour = Age)) +
  labs(x = "\n Breed Type", y = "Butterfat Percentage \n ", 
       title = "Butterfat Milk Content By Breed \n", fill = "Butterfat Age") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(hjust = 0.5, face="bold", size = 10))


# More Visible Version (Sideways):

ggplot(butterfat_data, aes(x = Breed, y = Butterfat)) +
  geom_point(size = 1.5, aes(colour = Age)) +
  labs(x = "\n Breed Type \n", y = "\n Butterfat Percentage \n ", 
       title = "Butterfat Milk Content By Breed \n", fill = "Butterfat Age") +
  coord_flip() +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(hjust = 0.5, face="bold", size = 10),
        panel.grid.major.x = element_blank())


#-------------------------------------------------

#### ggplot Dot Plot Using Breed Averages

library(dplyr) #For data manipulation and data wrangling.


# Create new dataset which has Breed, Age and the Breed Average.

butterfat_avg <- butterfat_data %>% group_by(Breed, Age) %>% 
                  summarise(Breed_Average = mean(Butterfat))

butterfat_avg <- data.frame(butterfat_avg)

# Check table:

butterfat_avg

# ggplot of breed types vs average butterfat percentage by age.

ggplot(butterfat_avg, aes(x = Breed, y = Breed_Average)) +
  geom_point(size = 1.5, aes(colour = Age)) +
  labs(x = "\n Breed Type", y = "Average Butterfat Percentage \n ", 
       title = "Average Butterfat Milk Content By Breed \n", fill = "Butterfat Age") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(hjust = 0.5, face="bold", size = 10))

# Sideways version:

# ggplot of breed types vs average butterfat percentage by age.

ggplot(butterfat_avg, aes(x = Breed, y = Breed_Average)) +
  geom_point(size = 1.5, aes(colour = Age)) +
  coord_flip() +
  labs(x = "\n Breed Type \n", y = "\n Average Butterfat Percentage \n ", 
       title = "Average Butterfat Milk Content By Breed \n", fill = "Butterfat Age") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(hjust = 0.5, face="bold", size = 10))

