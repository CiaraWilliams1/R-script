# Import the necessary packages.
library(tidyverse)
library(moments)

# Import the ggplot2 library.
library(ggplot2)

# Select your working directory.
setwd(dir = 'C:\\Users\\ciaraw\\OneDrive - Sport England\\Development\\LSE data analytics\\Course 3\\Module 5\\LSE_DA301_Module_5_files\\Data') 

# Import the CSV file (insurance.csv). The CSV file has headers.
insurance <- read.csv('insurance.csv', header=T)

# Explore the data.
head(insurance)
dim(insurance)
summary(insurance)
view(insurance)
str(insurance)

##########################################################
############## 2 Create visualisations
# Start with a simple scatterplot.
ggplot(insurance, aes(x=age, y=charges)) + 
  geom_point()

# Remove the outliers – specifically points that lie above 50,000 on the plot:
# Remove outliers (>50,000).
# Create a new data frame to store the data set.
# Create a new scatteplot.
new_health <- filter(insurance, charges<50000)

# new scatter plot
ggplot(new_health, aes(x=age, y=charges)) + 
  geom_point()

# Create three scatterplots to compare age and charges 
# based on sex, region, and children.
## i - Compare age and charges based on sex.
# Change colours, adjust size and alpha of points.
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='purple',
             alpha=0.5,
             size=2.5) +
  # Add labels and change axes marks.
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  # Add a title and subtitle.
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") +
  # Facet by sex.
  facet_wrap(~sex)


## ii - Compare age and charges based on region.
# Facet by region
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='blue',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") + 
  facet_wrap(~region)


## iii - Compare age and charges based on children.
# Facet by children
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='red',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") + 
  facet_wrap(~children)


# 2d) Add a third variable (smoker)

# Create a scatterplot to view result.
ggplot(new_health, 
       mapping=aes(x=age, y=charges, col=smoker)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of member") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges")


