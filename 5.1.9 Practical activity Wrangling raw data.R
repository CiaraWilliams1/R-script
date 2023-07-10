# Import the library.
library(tidyverse)
library(skimr)
library(DataExplorer)
library(dplyr)

# set directory and read in data
setwd(dir = 'C:\\Users\\ciaraw\\OneDrive - Sport England\\Development\\LSE data analytics\\Course 3\\Module 5\\LSE_DA301_Module_5_files\\Data') 
police <- read.csv('police.csv', header = TRUE)

# View data
View(police)
as_tibble(police)

# check dimensions
dim(police)

#########################
# 2 Determine whether there are missing values and how to address them if there are
sum(is.na(police))

# New dataframe excluding rows with missing values
police_tidy <- na.omit(police)
dim(police_tidy)

# Sense check new data frame
sum(is.na(police_tidy))
head(police_tidy)

# Check the summary statistics
summary(police_tidy)

# This function creates a downloadable HTML file containing summary stats of the data set.
DataExplorer::create_report(police_tidy)

####################################
# 3. Perform data manipulation
# Delete unnecessary columns
police_tidy <- select(police_tidy, -c(X, idNum, date, MDC, preRace, race, lat, long, policePrecinct, citationIssued, personSearch, vehicleSearch))

# View the results
colnames(police_tidy)
dim(police_tidy)

# Rename the column names with title case
names(police_tidy) <- str_to_title(names(police_tidy))

# Sense check
head(police_tidy)

# Determine the unique values in the remaining columns with the unique() function
unique(police_tidy$Gender)
unique(police_tidy$Problem)
unique(police_tidy$Neighborhood)

##############################################################

# 4. Answer the questions based on your analysis:

# Visualise the three columns with the barplot() function to answer the posed questions. 
# How many offences were suspicious compared to traffic?
barplot(table(police_tidy$Problem),
        main='Police reports',
        xlab='Offense',
        ylab='Count',
        col='red')

# How many offences were gender based?
barplot(table(police_tidy$Gender),
        main='Police reports',
        xlab='Gender',
        ylab='Count',
        col='blue')


# How do the neighbourhoods compare?
barplot(table(police_tidy$Neighborhood),
        main='Police reports',
        xlab='Neighbourhood',
        ylab='Count',
        col='green')

# View data as tables
table(police_tidy$Gender)  
table(police_tidy$Problem)
table(police_tidy$Neighborhood)

# Determine only females with traffic.
nrow(subset(police_tidy,
            Gender=='Female' & Problem=='traffic'))

# Determine only males with traffic.
nrow(subset(police_tidy, Gender=='Male' & Problem=='traffic'))

# Determine the Neighborhood with the most Problems with the count() and sort() functions
police_tidy %>% count(Neighborhood, sort=TRUE)
