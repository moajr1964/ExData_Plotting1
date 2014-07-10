# Author - MMCJ - Thu Jul 10 13:34:33 2014

# Plotting #Plot 3 - plot of Sub_metering (1, 2, 3) weekdays [Thr - Fry]
# NOTEBOOK
setwd("C:\\Users\\ITA\\Dropbox\\week1.exploratory.data.analysis")
# ITA Desktop
setwd("C:\\Users\\Moacyr\\Dropbox\\week1.exploratory.data.analysis")

# Read the Data

housePower<-read.csv2(".\\exdata_data_household_power_consumption\\household_power_consumption.txt",
                      header=TRUE, stringsAsFactors=FALSE)  

# Subsseting data to "1/2/2007" and "2/2/2007" #Brazilian format
housePower.filter.1<-subset(housePower, Date=="1/2/2007")
housePower.filter.2<-subset(housePower, Date=="2/2/2007")
housePower.filter<-rbind(housePower.filter.1,housePower.filter.2)
head(housePower.filter)

# converting to data format
DateTime<-paste(housePower.filter[,1],housePower.filter[,2])
DateTimeConverted<-strptime(DateTime, "%d/%m/%Y %H:%M:%S")

# Creates a new data frame, with date and time put together
housePower.1<-cbind(DateTimeConverted,housePower.filter[,3:9])
head(housePower.1)

# Creates Plot3.png with 480 pixels Height and Width #pixels are default
png(filename= "plot3.png", width = 480, height = 480)
plot((housePower.1[,1]),as.numeric(housePower.1[,6]), main="", 
     ylab="Energy sub metering", xlab=" ", col="black", type="l")
points((housePower.1[,1]),as.numeric(housePower.1[,7]), main="", 
       ylab="Energy sub metering", xlab=" ", col="red", type="l")
points((housePower.1[,1]),as.numeric(housePower.1[,8]), main="", 
       ylab="Energy sub metering", xlab=" ", col="blue", type="l")

legend("topright",lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.off() # Close the device

#----------END--PLOT-3------------------------------------------
