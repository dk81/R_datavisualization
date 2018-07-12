# lattice package in R
# Experimental Work
# http://statmethods.net/advgraphs/trellis.html

# lattice data visualization pacakge builds upon R's base graphics

# Load lattice package into R:

library(lattice)

# From http://statmethods.net/advgraphs/trellis.html

# Lattice Examples
library(lattice)
attach(mtcars)

# create factors with value labels
gear.f<-factor(gear,levels=c(3,4,5),
               labels=c("3gears","4gears","5gears"))
cyl.f <-factor(cyl,levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl"))

# kernel density plot
densityplot(~mpg,
            main="Density Plot",
            xlab="Miles per Gallon")


#--------------------

# Main formula template is: graph_type(formula, data = ... ) 

# Histogram lattice plot:

norms <- rnorm(10000)

histogram(~ norms,
          main = "Histogram Of Standard Normals",
          xlab = "Realized Values (Z-Score)",
          ylab = "Frequency",
          col = "green")

# Bar Chart Example:

answers <- c("Yes", "No")
counts <- c(47, 62)

barchart(counts ~ answers,
         main = "Survey Results",
         xlab = "Answer",
         ylab = "Counts \n",
         col = "red",
         ylim = c(0, 70))

# Scatterplot Example With lattice:
# ?star for documentation of dataset

require(faraway)
data(star)

head(star)

dotplot(light ~ temp, 
        main = "Star Temperature Vs. Light Intensity",
        data = star,
        xlab = "Temperature",
        ylab = "Light Intensity \n ")