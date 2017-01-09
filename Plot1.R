##Load the Data 
##by Roberto Ulises Pérez 

# Unzip the file directly in the web 
if(!file.exists("exdata-data-household_power_consumption.zip")) {
    temp <- tempfile()
     download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
     file <- unzip(temp)
     unlink(temp)

#Read the table 
energia <- read.table(file, header=T, sep=";")

#Change the data acording the fields formats     
energia$Date <- as.Date(energia$Date, format="%d/%m/%Y")
#We selected both dates 2007-02-01 and 2007-02-02 
total <- energia[(energia$Date=="2007-02-01") | (energia$Date=="2007-02-02"),]

#Convert each Field    
total$Global_active_power<-as.numeric(as.character(total$Global_active_power))
> total$Global_reactive_power<-as.numeric(as.character(total$Global_reactive_power))
> total$Voltage<-as.numeric(as.character(total$Voltage))
> total<-transform(total,timestamp=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")
> total$Sub_metering_1<-as.numeric(as.character(total$Sub_metering_1))
> total$Sub_metering_2<-as.numeric(as.character(total$Sub_metering_2))
> total$Sub_metering_3<-as.numeric(as.character(total$Sub_metering_3))
