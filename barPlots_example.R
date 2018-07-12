# Bar Plots Example In R:

library(faraway) # Dataset package
library(ggplot2) # Data visualization package.

suicide_data <- suicide

# Preview data:
head(suicide_data); tail(suicide_data)

# Check structure of data:

str(suicide_data)

#### Some Data Cleaning:

# Rename columns:

colnames(suicide_data) <- c("Count", "Cause", "Age", "Sex")


# In Sex column, change m to Male and f to Female:

gender <- function(x){
          if(x == "m"){
            x = "Male"
          }else if (x == "f"){
            x = "Female"
          }
          }

suicide_data$Sex <- sapply(suicide_data$Sex, gender)

# In Age column m = "middle-aged", o = "old", y = "young":

age_group <- function(x){
              if (x == "m"){
                x = "Middle-Aged"
              }else if (x == "o"){
                x = "Old"
              }else if (x == "y"){
                x = "Young"
              }
}

suicide_data$Age <- sapply(suicide_data$Age, age_group)

#### Bar Plot By Gender (x axis for Cause, y axis for Counts, colours for Age):
# More suicide deaths from males than females in general from the data

ggplot(suicide_data, aes(x = Cause, y = Count, fill = Age)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "\n Cause Of Death", y = "Count \n", 
       title = "One Year Of Suicide Data In UK \n\n", fill = "Age Group \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        axis.text.x = element_text(angle = 90,vjust = 0.2, hjust = 1),
        legend.title = element_text(face="bold", size = 10)) +
  facet_grid(. ~ Sex)



