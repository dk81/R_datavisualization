# Pie Charts In R:

# Example: Made Up Survey Data (Favourite Colours):

# Reference: 
# http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization
# http://stackoverflow.com/questions/20442693/how-to-use-ggplot2-to-generate-a-pie-graph

food_choices <- c("Pizza", "Pasta", "Sushi", "Caesar Salad")

counts <- c(17, 10, 8, 11)

table <- data.frame(food_choices, counts) # Create data frame

# Check table:

table

# Check structure of table:

str(table)

# Putting In Column Names:

colnames(table) <- c("Food", "Count")

# Check:

table

# Total Counts In Survey:

total_count <- sum(table[,2])

total_count

#-------------------------------

### Creating The Pie Chart:

## Base R Pie Chart With Labels:

pie(table[, 2], labels = table[,1], 
    col = c("Blue", "Red", "Green", "Orange"),
    main = "Favourite Foods Survey")

## ggplot2 Pie Chart:

library(ggplot2)

# Why Barplot Is Not A Good Visual:

ggplot(table, aes(x = "", y = Count, fill = Food)) +
  geom_bar(width = 1, stat = "identity")

# Pie Chart:

ggplot(table, aes(x = "", y = Count, fill = Food)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y", start = 0) +
  scale_fill_manual(values = c("Blue", "Red", "Green", "Orange")) +
  labs(x = "", y = "", title = "Favourite Food Survey \n",
       fill = "Colour Choices") + 
  theme(plot.title = element_text(hjust = 0.5), 
        legend.title = element_text(hjust = 0.5, face="bold", size = 10))

#-------------------------


# Pie Chart With Percentage Labels:

# http://stackoverflow.com/questions/41338757/adding-percentage-labels-on-pie-chart-in-r
# For percents the reference is:
# http://stackoverflow.com/questions/7145826/how-to-format-a-number-as-percentage-in-r

library(dplyr) #Data Wrangling and Manipulation

#library(scales) # For percents and formatting

# Add Proportion / Percentage Column using dplyr package:

#table <- table %>%
#          arrange(desc(Count)) %>%
#            mutate(Proportion = percent(Count/total_count)) 

# http://stackoverflow.com/questions/41338757/adding-percentage-labels-on-pie-chart-in-r
# food_choices[length(food_choices):1] is the reverse of 
# food_choices <- c("Pizza", "Pasta", "Sushi", "Caesar Salad")

table_percent <- table %>%
            mutate(Food = factor(Food, 
                levels = food_choices[length(food_choices):1]),
              cumulative = cumsum(Count),
                midpoint = cumulative - Count / 2,
                labels = paste0(round((Count/ sum(Count)) * 100, 1), "%"))

# Check table:

table_percent

# ggplot Pie Chart with percentage labels

ggplot(table_percent, aes(x = "", y = Count, fill = Food)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y", start = 0) +
  scale_fill_manual(values = c("Blue", "Red", "Green", "Orange")) +
  labs(x = "", y = "", title = "Favourite Food Survey \n",
       fill = "Food Choices") + 
  geom_text(aes(x = 1.2, y = midpoint , label = labels), color="black",
            fontface = "bold") +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.title = element_text(hjust = 0.5, face="bold", size = 10))  
  
  
#----------------------

# Pie Chart With Percentage & Counts Labels:

table_labels <- table %>%
  mutate(Food = factor(Food, 
                       levels = food_choices[length(food_choices):1]),
         cumulative = cumsum(Count),
         midpoint = cumulative - Count / 2,
         labels = paste0(round((Count/ sum(Count)) * 100, 1), "%", " (", Count, ") "))

# Check table:

table_labels

# ggplot Pie Chart with percentage labels

ggplot(table_labels, aes(x = "", y = Count, fill = Food)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar(theta = "y", start = 0) +
  scale_fill_manual(values = c("Blue", "Red", "Green", "Orange")) +
  labs(x = "", y = "", title = "Favourite Food Survey \n",
       fill = "Food Choices") + 
  geom_text(aes(x = 1.2, y = midpoint , label = labels), color="black",
            fontface = "bold") +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.title = element_text(hjust = 0.5, face="bold", size = 10))  


