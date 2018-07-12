# Multiple Plots In One Graph In R
# http://lightonphiri.org/blog/ggplot2-multiple-plots-in-one-graph-using-gridextra

library(ggplot2)
library(gridExtra) # For grid.arrange and multiple plots


# Normals Plot:

normals <- rnorm(n = 10000, mean = 0, sd = 1)

norm_plot <- ggplot(data = NULL, aes(normals)) +
  geom_histogram(binwidth = 0.1, boundary = 2, col = "black", fill = "#D5ADA4") + 
  labs(x = "\n Number Of Standard Deviations (Z-Scores)", y = "Count \n", title = "Simulated Standard Normal Variates\n") +
  theme(plot.title = element_text(hjust = 0.5, size = 13, face = "bold", colour = "darkgreen"), 
        axis.title.x = element_text(face="bold", colour="#6f0000", size = 12),
        axis.title.y = element_text(face="bold", colour="#6f0000", size = 12))

# Show normals plot:
norm_plot


# Exponential Plot:

exponentials <- rexp(n = 10000, rate = 3)

exps_plot <- ggplot(data = NULL, aes(exponentials)) +
  geom_histogram(binwidth = 0.1, boundary = 2, col = "black", fill = "#b7b700") + 
  labs(x = "\n Value Of Exponential Random Variable", y = "Count \n", title = "Simulated Exponential Random Variables \n") +
  theme(plot.title = element_text(hjust = 0.5, size = 13, face = "bold", colour = "darkgreen"), 
        axis.title.x = element_text(face="bold", colour="#6f0000", size = 12),
        axis.title.y = element_text(face="bold", colour="#6f0000", size = 12))

# Show exponentials plot:
exps_plot


# Two plots in one:
grid.arrange(norm_plot, exps_plot, ncol = 2)


