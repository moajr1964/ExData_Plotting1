# Plotting #Plot 4 - $ Plots 
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


# Creates Plot4.png with 480 pixels Height and Width #pixels are default
png(filename= "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2),mar=c(4,4,1,2), oma=c(0,0,0,0))

#Graph #1
plot((housePower.1[,1]),as.numeric(housePower.1[,2]), main="", 
     ylab="Global Active Power", xlab=" ", col="black", type="l")

#Graph #2
plot((housePower.1[,1]),as.numeric(housePower.1[,4]), main="", 
     ylab="Voltage", xlab="datetime", col="black", type="l")

#Graph #3
plot((housePower.1[,1]),as.numeric(housePower.1[,6]), main="", 
     ylab="Energy sub metering", xlab=" ", col="black", type="l")
points((housePower.1[,1]),as.numeric(housePower.1[,7]), main="", 
       ylab="Energy sub metering", xlab=" ", col="red", type="l")
points((housePower.1[,1]),as.numeric(housePower.1[,8]), main="", 
       ylab="Energy sub metering", xlab=" ", col="blue", type="l")

legend("topright",lty=c(1,1,1), col=c("black","red","blue"), bty="n",  cex=0.7,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Graph #4
plot((housePower.1[,1]),as.numeric(housePower.1[,3]), main="", 
     ylab="Global_reactive_power", xlab="datetime", col="black", type="l")

dev.off() # Close the device

#----------END--PLOT-4------------------------------------------
