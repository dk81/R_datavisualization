# Bar Graphs in R:

# Making Bar Graphs in R Using ggplot2:

library("ggplot2")

# Roll a 6 sided die 1000 times and produce a bar graph of the results:

# Set random seed for repoducibility:

set.seed(100)

# Run die roll simulations:

result <- sample(1:6, size = 1000, replace = TRUE)

# Get counts of the die rolls:

table(result)

# Initialize vector of results:


die_names <- c("One", "Two", "Three", "Four", "Five", "Six")

outcome_data <- rep(NA, 6)

for (i in 1:6) {
  outcome_data[i] <- as.numeric(sum(result == i))
}

# http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/
# http://docs.ggplot2.org/0.9.2.1/labs.html

# , levels = die_names
# Put our results to a data frame:

results_data <- data.frame(Number = factor(die_names, levels = die_names),
                          Counts = outcome_data)

results_data

# \n for newline and spacing of labels on the axes:

ggplot(data = results_data, aes(x = Number, y = Counts)) + 
  geom_bar(stat = "identity", alpha = 0.8) +
  xlab("\n Result on Die") +
  ylab("Frequency\n") +
  ggtitle("Die Roll Results \n") +
  ylim(0,200) +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour= "darkblue", size = 12),
        axis.title.y = element_text(face="bold", colour= "darkblue", size = 12),
        axis.text.x = element_text(angle = 90))





