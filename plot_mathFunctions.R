# Plotting Functions In R:
# Reference: R Graphics Cookbook
# http://www.sthda.com/english/wiki/ggplot2-add-straight-lines-to-a-plot-horizontal-vertical-and-regression-lines

library(ggplot2)


### 1) Parabola:

quadratic_fun <- function(x){
  x^2
}

# Basic Plot (Data frame for setting the range)
ggplot(data.frame(x = c(-15,15)), aes(x = x)) +
  stat_function(fun = quadratic_fun) + xlim(c(-15, 15)) 

# Parabola Plot With Labels:

ggplot(data.frame(x = c(-15,15)), aes(x = data.frame(x = x))) +
  stat_function(fun = quadratic_fun) + xlim(c(-15, 15)) +
  labs(x = "\n x", y = "y \n") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = 0, y = 200, parse = TRUE, size = 5, fontface = "bold",
           label="y == x^2")

#-----------------------------

### 2) Sine Function:

sine_funct <- function(xrange){
  sin(xrange)
}

# Sine Graph Plot With Labels:

sinePlot <- ggplot(data.frame(x = c(-10*pi, 10*pi)), aes(x = x)) +
  stat_function(fun = sine_funct) + xlim(c(-5*pi, 5*pi)) + ylim(c(-3, 3)) +
  labs(x = "\n x", y = "y \n") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = 0, y = 2.5, parse = TRUE, size = 5, fontface = "bold",
           label="y == sin(x)")

# Output the graph:
sinePlot

# Add a line y = 0 to sine plot:

sinePlot + geom_hline(yintercept = 0, linetype = "dotted", colour = "red")

#-----------------------------

### 3) Absolute Function:

absolute_funct <- function(x){
  ifelse(x >=0, x, - x)
}

# Absolute Value Plot:

ggplot(data.frame(x = c(-10, 10)), aes(x = x)) +
  stat_function(fun = absolute_funct) + xlim(c(-15, 15)) +
  labs(x = "\n x", y = "y \n") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = 0, y = 13, parse = TRUE, size = 5, fontface = "bold",
           label="y == abs(x)")

#-----------------------------

# 4) Square Root Function

sqroot_funct <- function(x){
  if (x >= 0) {
    sqrt(x)
  }
}

# Square Root Plot With Labels:

ggplot(data.frame(x = c(0, 20)), aes(x = x)) +
  stat_function(fun = sqroot_funct) + xlim(c(0, 15)) + ylim(c(-1, 5)) +
  labs(x = "\n x", y = "y \n") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = 10, y = 0, parse = TRUE, size = 5, fontface = "bold",
           label="y == sqrt(x)")



#-----------------------------

# 5) Reciprocal Function 

recip_funct <- function(x){
   1/x
}

# 1/x Plot With Labels:

recipPlot <- ggplot(data.frame(x = c(-20, 20)), aes(x = x)) +
  stat_function(fun = recip_funct) + xlim(c(-15, 15)) + ylim(c(-10, 10)) +
  labs(x = "\n x", y = "y \n") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = 10, y = 5, parse = TRUE, size = 5, fontface = "bold",
           label="y == 1/x")

# Output:
recipPlot

# Horizontal and Vertical Asymptotes:

recipPlot + geom_hline(yintercept = 0, linetype = "dotted", colour = "red") +
  geom_vline(xintercept = 0, linetype = "dotted", colour = "red")


#-----------------------------

# 6) Exponential Function (e^x with e approx 2.718)

exp_funct <- function(x){
  exp(x)
}

# Exponential Plot With Labels:

expPlot <- ggplot(data.frame(x = c(-5, 5)), aes(x = x)) +
  stat_function(fun = exp_funct) + xlim(c(-7, 7)) + ylim(-1, 500) +
  labs(x = "\n x", y = "y \n") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = -4, y = 400, parse = TRUE, size = 5, fontface = "bold",
           label="y == e^x")

# Output:

expPlot

# Output with axes (and asymptotes):

expPlot + geom_hline(yintercept = 0, linetype = "dashed", colour = "darkgreen") +
  geom_vline(xintercept = 0, linetype = "dashed", colour = "darkgreen")

#-----------------------------

# 7) Logarithmic Function

log_funct <- function(x){
  log(x)
}

# Logarithmic Plot With Labels:

logPlot <- ggplot(data.frame(x = c(-0.5, 4)), aes(x = x)) +
  stat_function(fun = log_funct) + xlim(c(-1, 4)) + ylim(-15, 7) +
  labs(x = "\n x", y = "y \n") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = 5, y = 3, parse = TRUE, size = 5, fontface = "bold",
           label="y == log(x)")

# Output:

logPlot

# Output with axes (and asymptotes):

logPlot + geom_hline(yintercept = 0, linetype = "dashed", colour = "darkgreen") +
  geom_vline(xintercept = 0, linetype = "dashed", colour = "darkgreen")

#----------------------------------------

### Combining Parabola and y = x line:

ggplot(data.frame(x = c(-5,5)), aes(x = data.frame(x = x))) +
  stat_function(fun = quadratic_fun, colour = "red") + xlim(c(-5, 5)) + ylim(c(-3,10)) +
  labs(x = "\n x", y = "y \n") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", colour = "blue") +
  theme(axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12)) +
  annotate("text", x = -4, y = 8, parse = TRUE, size = 5, fontface = "bold",
           label="y == x^2") +
  annotate("text", x = 4.5, y = 2, parse = TRUE, size = 5, fontface = "bold",
           label="y == x") +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = 0)


#---------------------------

# Normal distribution:

#xvalues <- data.frame(x = c(-3, 3))

#ggplot(xvalues, aes(x = xvalues)) +
  #stat_function(fun = dnorm) + xlim(c(-4, 4))

