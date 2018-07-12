# Bar Graphs in R:

# Making Bar Graphs in R Using ggplot2:

library("ggplot2")

# We have players A and B:
# They each flip an unfair coin 100 times. There is a 30% chance of getting heads and
# a 70% chance of getting tails.

# Flip a unfair coin 1000 times 

flip_results_A <- sample(c("Heads", "Tails"), size = 1000, replace = TRUE, prob = c(0.3, 0.7))
flip_results_B <- sample(c("Heads", "Tails"), size = 1000, replace = TRUE, prob = c(0.3, 0.7))

# Get counts of the die rolls:

table(flip_results_A) ; table(flip_results_B)

# Merge the results from Player A and Player B together:
# Format: Player A | Player A flip results (1000 rows)
#         Player B | Player B flip results (1000 rows)

column1 <- c(rep("Player A", 1000), rep("Player B", 1000))
column2 <- c(flip_results_A, flip_results_B)

outcome_data <- cbind(column1, column2)

flip_results <- data.frame(Player = factor(column1, levels = c("Player A", "Player B")),
                           Result = column2)

# A peek of the merged data:
head(flip_results); tail(flip_results)

# A two by two table:

table(flip_results)

# The two by two table into a data frame for plotting:

results <- data.frame(table(flip_results)); results



##-------------------------------------------------------------------

# Plotting side by side bar graphs:

# http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/
# R Graphics Cookbook by Winston Chang Reference
# Result of heads or tails in x = axis, Counts as y axis, diff colours for each player.
# Put labels:

ggplot(data = results, aes(x = Result, y = Freq, fill = Player)) +
  geom_bar(stat = "identity", position = position_dodge(), alpha = 0.75)  +
  ylim(0,800) +
  geom_text(aes(label = Freq), fontface = "bold", vjust = 1.5,
             position = position_dodge(.9), size = 4) +
  labs(x = "\n Coin Flip Outcome", y = "Frequency\n", title = "\n Coin Flip Results \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="red", size = 12),
        axis.title.y = element_text(face="bold", colour="red", size = 12),
        legend.title = element_text(face="bold", size = 10))


# Facet_grid:

ggplot(data = results, aes(x = Result, y = Freq)) +
  geom_bar(stat = "identity", alpha = 0.7) +
  facet_grid(. ~Player)  +
  ylim(0,800) +
  geom_text(aes(label = Freq), fontface = "bold", vjust = 1.5, colour = "white", size = 4) +
  labs(x = "\n Coin Flip Outcome", y = "Frequency\n", title = "\n Coin Flip Results \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(face="bold", size = 10),
        strip.background = element_rect(fill="lightblue", colour="black", size=1),
        strip.text = element_text(face="bold", size=rel(1.2)))

