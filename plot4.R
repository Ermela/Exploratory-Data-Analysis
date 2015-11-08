##Data download and read

dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfolder <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
textfile <- "exdata-data-household_power_consumption"
if (!file.exists(zipfolder)) { download.file(dataurl,zipfolder) }
if (!file.exists(textfile)) { unzip(textfile) }

household_power_consumption <- read.csv("C:/Users/User/Exploratory Data Analysis/household_power_consumption.txt", header=T, sep=";",na.strings="?")
household_power_consumptionfinal<- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]
Settime <-strptime(paste(household_power_consumptionfinal$Date, household_power_consumptionfinal$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
household_power_consumptionfinal <- cbind(Settime, household_power_consumptionfinal)

##Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colours <- c("black","red","blue")
par(mar=c(4,4,2,2))
par(mfrow=c(2,2))
par(pin=(1,1))
  plot(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
  plot(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
  plot(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Sub_metering_2, type="l", col="red")
  lines(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Sub_metering_3, type="l", col="blue")
  legend("topright", bty="n", legend=labels, lty=1,cex=0.5, col=colours)
  plot(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
    