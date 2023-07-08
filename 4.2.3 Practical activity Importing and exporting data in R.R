install.packages('EUfootball')

library('EUfootball')

install.packages('tidyverse')

vignette('tidy-data')

# get working directory
getwd()

# set working directory
setwd(dir = 'C:\\Users\\ciaraw\\OneDrive - Sport England\\Development\\LSE data analytics\\Course 3\\Module 4\\LSE_DA301_Module_4_files\\Data') 

# Read in data
bike <- read.csv(file = "bike_details.csv", header = TRUE, sep=',', stringsAsFactors=FALSE)

# Check read in
print(bike)

# check structure
str(bike)

# import tidyverse
library(tidyverse)

# sense check the data
View(bike)
dim(bike)
typeof(bike)
class(bike)

# Export the data to data output subfolder
write_csv(bike, file='data_output/bike.csv')
