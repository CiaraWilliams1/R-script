
# Determine the working directory.
getwd() 

# Change the current directory.
setwd(dir = 'C:\\Users\\ciaraw\\OneDrive - Sport England\\Development\\LSE data analytics\\Course 3\\Module 4\\') 

# Read in data
book_df <- read.table(file = "bennies_books_loyalty_data.txt", header = FALSE, sep='\t', stringsAsFactors=FALSE)

# Check read in
print(book_df)

# Create the data frame
df2 <- data.frame(book_df)

# Check data frame structure
typeof(df2)
class(df2)

# Change column names
names(df2) <- c('Name','Last_Name','Gender','Age','Email','Purchases')

# Print again
print(df2)

# Confirm dimensions
dim(df2)

# Create a new object called age.
ID <- c(10, 35, 40, 5, 1, 2, 3, 4, 5, 6) 

# Add the new object to the data frame.
df2$ID <- ID

# Print the data frame.
df2

# Return structure of data frame
str(df2)

# Return subsets
subset(df2, Gender=='F')
subset(df2, Age>50)
subset(df2, Purchases<20)
