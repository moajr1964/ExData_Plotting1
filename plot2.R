# Author - MMCJ - Thu Jul 10 13:34:33 2014

# Plotting #Plot 2 - histogram of Global Active Power (kilowatts)
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


# Creates Plot2.png with 480 pixels Height and Width #pixels are default
png(filename= "plot2.png", width = 480, height = 480)
plot((housePower.1[,1]),as.numeric(housePower.1[,2]), main="", 
     ylab="Global Active Power (kilowatts)", xlab=" ", col="black", type="l")
 
dev.off() # Close the device

#----------END--PLOT-2------------------------------------------
