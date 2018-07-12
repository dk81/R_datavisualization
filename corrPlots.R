# Correlation Plot
# Reference: 
# http://www.sthda.com/english/wiki/ggplot2-quick-correlation-matrix-heatmap-r-software-and-data-visualization


library(faraway)
library(corrplot)

gamb_data <- teengamb

# Preview data:

head(gamb_data)
tail(gamb_data)

# Check summary and data structure:

summary(gamb_data)
str(gamb_data)

# Fixing column names:

colnames(gamb_data) <- c("Sex", "Status", "Income", "Verbal", "Gamble")

# Correlation

corr_gamb <- cor(gamb_data)

corr_gamb

# Corrplot correlation plot:
# tl.col = text label colour, tl.srt = string rotation for text
# tl.cex = size of text label, bg = background colour
# method = "shade" for coloured squares
# type = "full" for full matrix

# Version One:

corrplot(corr_gamb, tl.col = "brown", tl.srt = 30, bg = "White",
         title = "Correlation Plot Of Gambling Data",
         type = "full")

# Version Two (Lower Triangular Of Correlation Matrix):

corrplot(corr_gamb, tl.col = "red", tl.srt = 45, bg = "White",
         title = "Correlation Plot Of Gambling Data",
         type = "lower")

# Version Three (Added Labels):

corrplot(corr_gamb, tl.col = "red", bg = "White", tl.srt = 35, 
         title = "\n Correlation Plot Of Gambling Data \n",
         addCoef.col = "black", type = "full")

# Version Four (Change colour pallete with HTML colour codes):

colour_set <- colorRampPalette(colors = c("#f4ff4d", "#c7d123", "#acb515", "#81890b", "#656c06"))

corrplot(corr_gamb, tl.col = "blue", bg = "White", tl.srt = 35, 
         title = "\n Correlation Plot Of Gambling Data \n",
         addCoef.col = "black", type = "lower",
         col = colour_set(100))

# Version Five (Different Colours):

colour_set <- colorRampPalette(colors = c("#f4ff4d", "#c7d123", "#acb515", "#81890b", "#656c06"))

corrplot(corr_gamb, tl.col = "blue", bg = "gray", tl.srt = 35, 
         title = "\n Correlation Plot Of Gambling Data \n",
         addCoef.col = "black", type = "lower",
         col = colour_set(100))


#-------------------------------------------------

# Correlation plots using ggplot2:

library(ggplot2)
library(reshape2)

# Use the melt function to melt corr_gamb (or undo the table):

melted_gamb <- melt(corr_gamb)

head(melted_gamb)
tail(melted_gamb)


## Version One: Correlation Plot using ggplot2:

ggplot(data = melted_gamb, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(midpoint = 0.5, mid ="grey70", 
                       limits = c(-1, +1)) +
  labs(title = "Correlation Matrix \n On Teen Gambling Data \n", 
       x = "", y = "", fill = "Correlation \n Measure") +
  theme(plot.title = element_text(hjust = 0.5, colour = "blue"), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(face="bold", colour="brown", size = 10)) +
  geom_text(aes(x = Var1, y = Var2, label = round(value, 2)), color = "black", 
            fontface = "bold", size = 5) 



## Version Two: Upper Triangular Correlation Plot using ggplot2:

# Create new copy:

upper_gamb <- corr_gamb

# Make upper triangular matrix by setting NA to lower triangular part:
upper_gamb[lower.tri(upper_gamb)] <- NA

upper_gamb

# Melt this upper triangular matrix and remove NA values:

up_m_gamb <- melt(upper_gamb, na.rm = TRUE)

head(up_m_gamb)
tail(up_m_gamb)

# Ggplot upper triangular correlation matrix:

ggplot(data = up_m_gamb, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(midpoint = 0.5, mid ="grey70", 
                       limits = c(-1, +1)) +
  labs(title = "Correlation Matrix \n On Teen Gambling Data \n", 
       x = "", y = "", fill = "Correlation \n Measure") +
  theme(plot.title = element_text(hjust = 0.5, colour = "blue"), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(face="bold", colour="brown", size = 10)) +
  geom_text(aes(x = Var1, y = Var2, label = round(value, 2)), color = "black", 
            fontface = "bold", size = 5) 

## Version Three: Lower Triangular Correlation Plot using ggplot2:

# Create new copy:

lower_gamb <- corr_gamb

# Make lower triangular matrix by setting NA to upper triangular part:
lower_gamb[upper.tri(lower_gamb)] <- NA

lower_gamb

# Melt this upper triangular matrix and remove NA values:

lower_m_gamb <- melt(lower_gamb, na.rm = TRUE)

head(lower_m_gamb)
tail(lower_m_gamb)

# Ggplot lower triangular correlation matrix:

ggplot(data = lower_m_gamb, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(midpoint = 0.5, mid ="grey70", 
                       limits = c(-1, +1)) +
  labs(title = "Correlation Matrix \n On Teen Gambling Data \n", 
       x = "", y = "", fill = "Correlation \n Measure") +
  theme(plot.title = element_text(hjust = 0.5, colour = "blue"), 
        axis.title.x = element_text(face="bold", colour="darkgreen", size = 12),
        axis.title.y = element_text(face="bold", colour="darkgreen", size = 12),
        legend.title = element_text(face="bold", colour="brown", size = 10)) +
  geom_text(aes(x = Var1, y = Var2, label = round(value, 2)), color = "black", 
            fontface = "bold", size = 5) 