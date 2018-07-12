# Box Plots In R
# Ref: R Graphics Cookbook
# http://www.purplemath.com/modules/boxwhisk2.htm
# http://flowingdata.com/2008/02/15/how-to-read-and-use-a-box-and-whisker-plot/

library(faraway)
library(ggplot2)

# Put anaesthetic dataset into hosp_data variable:

hosp_data <- anaesthetic

# Preview the data:

head(hosp_data)

tail(hosp_data)

# Check structure and summary:

str(hosp_data)

summary(hosp_data)

# Column Names:

colnames(hosp_data) <- c("Time", "Treatment_Group")

# Boxplots:

ggplot(hosp_data, aes(x = Treatment_Group, y = Time))  + geom_boxplot() +
  labs(x = "\n Treatment Group", y = "Time To Start Breathing (Minutes) \n", 
       title = "Time To Start Breathing After Anaesthetic \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 10))

# Boxplot: Minimum, 25th percentile (box end), Median, 75th percentile
# (points outside are outliers)

# Adding means to boxplots (red square is mean, thick black line is median):

ggplot(hosp_data, aes(x = Treatment_Group, y = Time))  + geom_boxplot() +
  labs(x = "\n Treatment Group", y = "Time To Start Breathing (Minutes) \n", 
       title = "Time To Start Breathing After Anaesthetic \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 10)) +
  stat_summary(fun.y="mean", geom="point", shape=22, size=3, fill = "red", color = "red")