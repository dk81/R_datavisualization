## Plotting Continuous Probability Distributions Using ggplot2

library(ggplot2)

# Plot continuous probability distributions with ggplot2:

# Explain some ggplot2 basics and resources:

# Main Code Template:

# ggplot(x = data.frame(c(a, b)), aes(x = x)) 
#   + stat_function(fun = function_name) +
#   other add-on functions such as labels, text and so on.

#--------------

## 1) Standard Uniform Distribution Plot [Unif(0, 1)]

# Template Code from R Doc. : dunif(x, min = 0, max = 1, log = FALSE)

a <- 0; b <- 1

ggplot(data.frame(x = c(a, b)), aes(x = x)) + xlim(c(a, b)) + ylim(0, 1/(b - a)) +
  stat_function(fun = dunif, args = list(min = a, max = b), geom = "area", 
                fill = "purple", alpha = 0.35) + 
  stat_function(fun = dunif, args = list(min = a, max = b)) + 
  labs(x = "\n u", y = "f(u) \n", 
       title = "Standard Uniform Distribution Density Plot \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12))

#args = list() for inputting values in the function


#--------------

## 2) Exponential Distribution Plot:

# Template Code in R Doc.: dexp(x, rate = 1, log = FALSE)
# Mean is 1/rate

# Initialize some values.

x_lower <- 0
x_upper <- 5

max_height <- max(dexp(x_lower:x_upper, rate = 1, log = FALSE))
max_height

ggplot(data.frame(x = c(x_lower, x_upper)), aes(x = x)) + xlim(x_lower, x_upper) + 
  ylim(0, max_height) +
  stat_function(fun = dexp, args = list(rate = 1), geom = "area", 
                fill = "blue", alpha = 0.25) + 
  stat_function(fun = dexp, args = list(rate = 1)) + 
  labs(x = "\n x", y = "f(x) \n", 
       title = "Exponential Distribution Density Plot With Rate = 1 \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12))

# Multiple Exponential Distribution Plots:

x_lower <- 0
x_upper <- 5

max_height2 <- max(dexp(x_lower:x_upper, rate = 1, log = FALSE), 
                   dexp(x_lower:x_upper, rate = 2, log = FALSE),
                   dexp(x_lower:x_upper, rate = 3, log = FALSE),
                   dexp(x_lower:x_upper, rate = 0.5, log = FALSE))

max_height2

ggplot(data.frame(x = c(x_lower, x_upper)), aes(x = x)) + xlim(x_lower, x_upper) + 
  ylim(0, max_height2) +
  stat_function(fun = dexp, args = list(rate = 0.5), aes(colour = "0.5")) + 
  stat_function(fun = dexp, args = list(rate = 1), aes(colour = "1")) + 
  stat_function(fun = dexp, args = list(rate = 2), aes(colour = "2")) + 
  stat_function(fun = dexp, args = list(rate = 3), aes(colour = "3")) + 
  scale_color_manual("Rate", values = c("blue", "green", "red", "purple")) +
  labs(x = "\n x", y = "f(x) \n", 
       title = "Exponential Distribution Density Plots \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 10),
        legend.position = "right")

# References:
# https://stackoverflow.com/questions/31792634/adding-legend-to-ggplot2-with-multiple-lines-on-plot
# https://stackoverflow.com/questions/19950219/using-legend-with-stat-function-in-ggplot2

#--------------

## 3) Weibull Distribution Plot:

# R Doc. Template for Weibull: dweibull(x, shape, scale = 1, log = FALSE)

# Initialize some values.

x_lower_wei <- 0
x_upper_wei <- 5

max_height_wei <- max(dweibull(x_lower_wei:x_upper_wei, shape = 1, scale = 1, log = FALSE))
max_height_wei

# Shape Parameter (a) of 1 turns Weibull distribution to exponential distribution:

ggplot(data.frame(x = c(x_lower_wei , x_upper_wei)), aes(x = x)) + 
  xlim(c(x_lower_wei , x_upper_wei)) + 
  ylim(0, max_height_wei) +
  stat_function(fun = dweibull, args = list(shape = 1, scale = 1), geom = "area", 
                fill = "green", alpha = 0.25) + 
  stat_function(fun = dweibull, args = list(shape = 1, scale = 1)) + 
  labs(x = "\n x", y = "f(x) \n", 
       title = "Weibull Distribution With \n Shape & Scale Parameters = 1 \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12))

# Plotting Three Weibull Distributions:


x_lower_wei <- 0
x_upper_wei <- 10

# Excluded ylimits this time.

ggplot(data.frame(x = c(x_lower_wei , x_upper_wei)), aes(x = x)) + 
  xlim(c(x_lower_wei , x_upper_wei)) + 
  stat_function(fun = dweibull, args = list(shape = 2, scale = 3), aes(colour = "2 & 3")) + 
  stat_function(fun = dweibull, args = list(shape = 3, scale = 3), aes(colour = "3 & 3")) + 
  stat_function(fun = dweibull, args = list(shape = 3, scale = 4), aes(colour = "3 & 4")) + 
  scale_color_manual("Shape & Scale \n Parameters", values = c("blue", "green", "red")) +
  labs(x = "\n x", y = "f(x) \n", 
       title = "Weibull Distribution Plots") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 10),
        legend.position = "right")

#--------------

## 4) Gamma Distributions:

# R Doc Code for Gamma Dist:
# dgamma(x, shape, rate = 1, scale = 1/rate, log = FALSE)
# Have to specify rate or scale but not both.

# Initialize some values.

x_lower_g <- 0
x_upper_g <- 5

# No limitations on height.

# Gamma Distribution Plot With Rate = 2 and Scale = 0.5

ggplot(data.frame(x = c(x_lower_g , x_upper_g)), aes(x = x)) + 
  xlim(c(x_lower_g , x_upper_g)) + 
  stat_function(fun = dgamma, args = list(rate = 2, shape = 2), geom = "area", 
                fill = "orange", alpha = 0.25) + 
  stat_function(fun = dgamma, args = list(rate = 2, shape = 2)) + 
  labs(x = "\n x", y = "f(x) \n", 
       title = "Gamma Distribution With Rate & Shape = 2 \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12))

# Multiple Gamma Distributions:

x_lower_g <- 0
x_upper_g <- 5

ggplot(data.frame(x = c(x_lower_g , x_upper_g)), aes(x = x)) + 
  xlim(c(x_lower_g , x_upper_g)) + 
  stat_function(fun = dgamma, args = list(rate = 2, shape = 2), aes(colour = "2 & 2")) + 
  stat_function(fun = dgamma, args = list(rate = 1, shape = 2), aes(colour = "1 & 2")) + 
  stat_function(fun = dgamma, args = list(rate = 2, shape = 3), aes(colour = "2 & 3")) + 
  scale_color_manual("Rate & Shape \n Parameters", values = c("black", "blue", "red")) +
  labs(x = "\n x", y = "f(x) \n", 
       title = "Gamma Distribution Plots") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 10),
        legend.position = "right")


#--------------

## 5) Cauchy Distribution:

# R Doc code template: dcauchy(x, location = 0, scale = 1, log = FALSE)

x_lower_chy <- -7
x_upper_chy <- 7

max_height <- max(dcauchy(x_lower_chy:x_upper_chy , location = 0, scale = 1, log = FALSE))
max_height


ggplot(data.frame(x = c(x_lower_chy, x_upper_chy )), aes(x = x)) + xlim(c(x_lower_chy, x_upper_chy )) + 
  ylim(0, max_height) +
  stat_function(fun = dcauchy, args = list(location = 0, scale = 1), geom = "area", 
                fill = "green", alpha = 0.25) + 
  stat_function(fun = dcauchy, args = list(location = 0, scale = 1)) + 
  labs(x = "\n x", y = "f(x) \n", 
       title = "Cauchy Distribution With \n Location & Scale Parameters As 0 & 1 \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12))

## Mutliple Cauchy Density Plots:

x_lower_chy <- -10
x_upper_chy <- 10

ggplot(data.frame(x = c(x_lower_chy , x_upper_chy)), aes(x = x)) + 
  xlim(c(x_lower_chy , x_upper_chy)) + 
  stat_function(fun = dcauchy, args = list(location = 0, scale = 1), aes(colour = "0 & 1")) + 
  stat_function(fun = dcauchy, args = list(location = -1, scale = 1), aes(colour = "-1 & 1")) + 
  stat_function(fun = dcauchy, args = list(location = 2, scale = 2), aes(colour = "2 & 2")) + 
  scale_color_manual("Location & Shape \n Parameters", values = c("green", "purple", "red")) +
  labs(x = "\n x", y = "f(x) \n", 
       title = "Cauchy Distribution Plots") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 8),
        legend.position = "right")


#--------------

# Can run similar code for other distributions such as
# Beta, F-distribution, Chi-Squared, Log-Normal, Student's t-distribution

#--------------

# 6) Pareto Distribution Using Custom Function:

# Resource: http://www.math.wm.edu/~leemis/chart/UDR/PDFs/Pareto.pdf

# Pareto Density Function:
pareto_pdf <- function(x, lambda = 1, k = 1){
    density <- (k*(lambda^k)) / (x^(k + 1))
    return(density)
}

x_lower_pareto <- 1
x_upper_pareto <- 10



ggplot(data.frame(x = c(x_lower_pareto, x_upper_pareto)), aes(x = x)) + 
  stat_function(fun = pareto_pdf, args = list(lambda = 1, k = 1),
                geom = "area", fill = "green", alpha = 0.5) + 
  stat_function(fun = pareto_pdf, args = list(lambda = 1, k = 1)) + 
  labs(x = "\n x", y = "f(x) \n", 
       title = "Pareto Distribution Plot \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12))

# Multiple Pareto Distributions:

ggplot(data.frame(x = c(x_lower_pareto, x_upper_pareto)), aes(x = x)) + 
  xlim(c(x_lower_pareto, x_upper_pareto)) +
  stat_function(fun = pareto_pdf, args = list(lambda = 1, k = 1), aes(colour = "1 & 1")) + 
  stat_function(fun = pareto_pdf, args = list(lambda = 2, k = 1), aes(colour = "2 & 1")) + 
  stat_function(fun = pareto_pdf, args = list(lambda = 2, k = 1.5), aes(colour = "2 & 1.5")) + 
  scale_color_manual("Lambda & k \n Values", values = c("green", "purple", "red")) +
  labs(x = "\n x", y = "f(x) \n", 
       title = "Pareto Distribution Plots \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="blue", size = 12),
        axis.title.y = element_text(face="bold", colour="blue", size = 12),
        legend.title = element_text(face="bold", size = 8),
        legend.position = "right")