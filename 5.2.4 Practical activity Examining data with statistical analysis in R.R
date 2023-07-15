
# Import the necessary packages.
library(tidyverse)
library(moments)

# install.packages('BSDA')
library(BSDA)

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

#################################################################
######## Explore the bmi column
summary(insurance$bmi)
mean(insurance$bmi)
median(insurance$bmi)

# Measure the variability of BMI values.
# Range = Maximum - Minimum.
max(insurance$bmi)- min(insurance$bmi)  

# Function to calculate Q1.
quantile(insurance$bmi, 0.25)  

# Function to calculate Q2.
quantile(insurance$bmi, 0.75)   

# Function to calculate IQR.
IQR(insurance$bmi)    

# Function to determine the variance.
var(insurance$bmi)

# Function to return the standard deviation.
sd(insurance$bmi)

#################################################################
####### Determine whether the data (bmi column) is normally distributed

# Q-Q plot to determine normality.
qqnorm(insurance$bmi)
qqline(insurance$bmi)

# Shapiro-Wilk test to determine normality.
shapiro.test(insurance$bmi)
# Our p-value is <0.05,so the data is not normally distributed.

# Compute the skewness and kurtosis.
skewness(insurance$bmi) 
kurtosis(insurance$bmi)

#################################################################
####### Run a test to check the correlation between BMI and client age

# Check correlation between BMI and client age.
# Let's first check for normality in the client age values.
shapiro.test(insurance$age)
# Our output is less than 0.05, so the data is not normally distributed.

# Check correlation between BMI and age using Pearson's correlation.
cor(insurance$bmi, insurance$age)

# Our correlation coefficient of 0.11 suggests a weak positive correlation

