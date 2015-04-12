png(filename = "plot2.png", width=480, height=480, bg="transparent")
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

plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)", xlab="", xaxt="n")

## add custom x-axis
axis(side=1, at=c(1170309660,1170396060,1170482460), lab=c("Thu","Fri", "Sat"))

dev.off()