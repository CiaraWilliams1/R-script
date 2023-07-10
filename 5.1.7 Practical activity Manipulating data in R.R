# Import the library.
library(tidyverse)
library(skimr)
library(DataExplorer)

# set directory and read in data
setwd(dir = 'C:\\Users\\ciaraw\\OneDrive - Sport England\\Development\\LSE data analytics\\Course 3\\Module 5\\LSE_DA301_Module_5_files\\Data') 
seatbelt <- read.csv('seatbelt.csv', header = TRUE)

# View data
View(seatbelt)
as_tibble(seatbelt)
names(seatbelt)

# Check for missing values
sum(is.na(seatbelt))
sum(is.na(seatbelt$seatbelt))

# Replace missing values
seatbelt[is.na(seatbelt)] <- 0

# Check for missing values again
sum(is.na(seatbelt))

# Check the distribution
summary(seatbelt)

# This function creates a downloadable HTML file containing summary stats of the data set.
DataExplorer::create_report(seatbelt)

####################################################

# 3. perform data manipulation

# Drop unnecessary columns
seatbelt <- subset(seatbelt, select = -c(X))

# Keep only the numeric columns with the subset() function.
seatbelt <- seatbelt %>% keep(is.numeric)

# View the dataset
head(seatbelt)

# Round all columns to 2 decimal places
seatbelt <- round(seatbelt, 2)

#####################################################

# 4. Determine whether the columns are normally distributed with a boxplot

# Plot a boxplot
boxplot(seatbelt$year)
boxplot(seatbelt$miles)
boxplot(seatbelt$fatalities)
boxplot(seatbelt$income)
boxplot(seatbelt$age)

#########################################################

# 5. Use the apply family of functions:

# Verify the data structure.
class(seatbelt)

# Calculate the sum, max, and min of all the columns with the apply() function. Round the answers to two decimal places. (Hint: This might indicate whether the data is normally distributed.)
round(apply(seatbelt, 2, sum),2)
round(apply(seatbelt, 2, max),2)
round(apply(seatbelt, 2, min),2)


