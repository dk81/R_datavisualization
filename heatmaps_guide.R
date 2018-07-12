# Heatmaps in R:

# References:
# http://www.sthda.com/english/wiki/ggplot2-quick-correlation-matrix-heatmap-r-software-and-data-visualization
# R Graphics Cookbook by Winston Chang (2012)

# Load faraway dataset package and ggplot2 for data visualization:

library(faraway)
library(ggplot2)


## First Dataset:

compData <- composite

# See the data (not very big):

compData

# Structure of the dataset:

str(compData)

# Fix column names:

colnames(compData) <- c("Strength", "Laser", "Tape")

# Summary of the dataset:

summary(compData)

# Basic Heatmap Plot:

heatmap1 <- ggplot(compData, aes(x = Tape, y = Laser, fill = Strength)) + 
  geom_tile()

heatmap1

# Heatmap Plot (Fixed With labels):

heatmap1 + scale_x_discrete(labels = c("Slow (6.42 m/s)", "Medium (13 m/s)", "Fast (27 m/s)")) +
  scale_fill_gradient2(midpoint = median(compData$Strength), mid="grey70", 
                      limits = c(min(compData$Strength), max(compData$Strength))) +
  labs(x = "\n Tape Speed", y = "Laser Power\n", 
       title = "Strength Of Thermoplastic Composite \n Experiment Results \n",
       fill = "Composite \n Strength \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(face="bold", colour="brown", size = 10)) +
  geom_text(aes(x = Tape, y = Laser, label = Strength), color = "black", 
            fontface = "bold", size = 5) 

#------------------------

## Second Dataset:

eggprod_data <- eggprod

# Look at the data:

eggprod_data

# Data structure:

str(eggprod_data)

# Summary of the data:

summary(eggprod_data)

# Rename column names:

colnames(eggprod_data) <- c("Treatment", "Block", "Eggs")

# Basic Heatmap Plot:

heatmap2 <- ggplot(eggprod_data, aes(x = Treatment, y = Block, fill = Eggs)) + 
  geom_tile()

heatmap2

# Updated Heatmap Plot:

heatmap2 + scale_x_discrete(labels = c("E", "F", "O")) +
  scale_fill_gradient2(midpoint = median(eggprod_data$Eggs), mid ="grey70", 
                       limits = c(min(eggprod_data$Eggs), max(eggprod_data$Eggs))) +
  labs(x = "\n Treatment", y = "Block \n", fill = "Number Of Eggs \n",
       title = "Treatment And Block Effects \n On Egg Production \n") +
  theme(plot.title = element_text(hjust = 0.5, colour = "blue"), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(face="bold", colour="brown", size = 10)) +
  geom_text(aes(x = Treatment, y = Block, label = Eggs), color = "black", 
            fontface = "bold", size = 5) 