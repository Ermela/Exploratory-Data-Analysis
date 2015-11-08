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

##Plot 3
colours <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Sub_metering_1, type="l", col=colours[1], xlab="", ylab="Energy sub metering")
lines(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Sub_metering_2, col=colours[2])
lines(household_power_consumptionfinal$Settime, household_power_consumptionfinal$Sub_metering_3, col=colours[3])
legend("topright", legend=labels, col=colours, cex=0.5,lty="solid")
