# Author - MMCJ - "Thu Jul 10 16:34:08 2014"
 
# Plotting #Plot 1 - histogram of Global Active Power (kilowatts)
# NOTEBOOK
setwd("C:\\Users\\ITA\\Dropbox\\week1.exploratory.data.analysis")
# ITA Desktop
setwd("C:\\Users\\Moacyr\\Dropbox\\week1.exploratory.data.analysis")

library(sqldf)
# Read the Data # 1st alternative
housePower<-read.csv2(".\\exdata_data_household_power_consumption\\household_power_consumption.txt", na.strings="?",
                      header=TRUE, stringsAsFactors=FALSE)  

# Alternative way, filtering during the archive reading
# This solution is much more time consuming that the previous one
# So I Used the 1st one
myFile <- ".\\exdata_data_household_power_consumption\\household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile,mySql)
?read.csv2.sql

# Subseting data to "1/2/2007" and "2/2/2007" #Brazilian format
housePower.filter.1<-subset(housePower, Date=="1/2/2007")
housePower.filter.2<-subset(housePower, Date=="2/2/2007")
housePower.filter<-rbind(housePower.filter.1,housePower.filter.2)

# converting to data format
DateTime<-paste(housePower.filter[,1],housePower.filter[,2])
DateTimeConverted<-strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Creates a new data frame, with date and time put together
housePower.1<-cbind(DateTimeConverted,housePower.filter[,3:9])
head(housePower.1)


# Creates Plot1.png with 480 pixels Height and Width #pixels are default
png(filename= "plot1.png", width = 480, height = 480)
hist(as.numeric(housePower.1[,3]), main="Global Active Power", 
     ylab="Frequency", xlab="Global Active Power (kilowatts)", col="red")

dev.off() # Close the device

#----------END--PLOT-1------------------------------------------
 
