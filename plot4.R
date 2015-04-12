png(filename = "plot4.png", width=480, height=480, bg="transparent")
## We assume that the 'household_power_consumption.txt' file is in the current directory...
## read the header row...
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

## read the data...
data   <- read.table('household_power_consumption.txt', skip = 66638, nrows=2879, header = FALSE, na.string="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep =';')

## assign colnames...
colnames(data) <- unlist(header)

##convert date/time to unix Epoch...
for(i in 1:nrow(data)){
  data$DateTime[i] <- as.POSIXct(strptime(paste(as.Date(data$Date[i], format="%d/%m/%Y"), data$Time[i], sep=" "), "%Y-%m-%d %H:%M:%S"))
}

## create 2 x 2 plot matrix...
par(mfrow=c(2,2))

## First Graph...
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power", xlab="", xaxt="n")
## add custom x-axis
axis(side=1, at=c(1170309660,1170396060,1170482460), lab=c("Thu","Fri", "Sat"))

##Second Graph...
plot(data$DateTime,data$Voltage,type="l",ylab="Voltage", xlab="datetime", xaxt="n", yaxt="n")

## add custom x-axis
axis(side=1, at=c(1170309660,1170396060,1170482460), lab=c("Thu","Fri", "Sat"))
axis(side=2, at=c(234,236,238,240,242,244,246), lab=c("234","","238", "","242","","246"))

##Third Graph...
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="", xaxt="n")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")

## add custom x-axis
axis(side=1, at=c(1170309660,1170396060,1170482460), lab=c("Thu","Fri", "Sat"))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, lty = c(1,1,1), col=c("black", "red","blue"), bty = "n");

##Fourth Graph...
plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime", xaxt="n")
## add custom x-axis
axis(side=1, at=c(1170309660,1170396060,1170482460), lab=c("Thu","Fri", "Sat"))

dev.off()