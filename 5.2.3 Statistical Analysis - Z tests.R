# Import the necessary packages.
library(tidyverse)
library(moments)

# install.packages('BSDA')
library(BSDA)

# Select your working directory.
setwd(dir = 'C:\\Users\\ciaraw\\OneDrive - Sport England\\Development\\LSE data analytics\\Course 3\\Module 5\\LSE_DA301_Module_5_files\\Data') 

# Import the CSV file (watches.csv). The CSV file has headers.
watches <- read.csv('watches.csv', header=T)

# Explore the data.
head(watches)
dim(watches)
summary(watches)
view(watches)

# Visualise the data.
# Histogram:
hist(watches$Store_B)

# Boxplot:
boxplot(watches$Store_B)

# Calculate standard deviation
sd(watches$Store_B)
sd(watches$Store_A)

################# Confirm normality of the data

# Q-Q plot to determine normality.
qqnorm(watches$Store_B)
qqline(watches$Store_B)

# Shapiro-Wilk test to determine normality.
shapiro.test(watches$Store_B)

# Compute the skewness and kurtosis.
skewness(watches$Store_B) 
kurtosis(watches$Store_B)

#################### Compute one-sample z-test
# Average of 250 watches sold per year;
# Note that mu=250 for one-sample z-test.
z.test(watches$Store_B,
       mu=250,
       sigma.x=30.15)


####################### Two-sample z-test
# Visualise the data.
# Histogram:
hist(watches$Store_A)

# Boxplot:
boxplot(watches$Store_A)

# Q-Q plot to determine normality
qqnorm(watches$Store_A)
qqline(watches$Store_A)

# Shapiro-Wilk test to determine normality
shapiro.test(watches$Store_A)

# Compute skewness and kurtosis.
skewness(watches$Store_A) 
kurtosis(watches$Store_A)

# Average of 250 watches sold per year at both stores;
# Note that mu=0 for two-sample z-test.
z.test(watches$Store_B,
       watches$Store_A,
       mu=0,
       sigma.x = 30.15,
       sigma.y =12.26)



