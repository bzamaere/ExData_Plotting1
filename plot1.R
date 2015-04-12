png(filename = "plot1.png", width=480, height=480, bg="transparent")
## We assume that the 'household_power_consumption.txt' file is in the current directory...
## read the header row...
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)

## read the data...
data   <- read.table('household_power_consumption.txt', skip = 66638, nrows=2879, header = FALSE, na.string="?",colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep =';')

## assign colnames...
colnames(data) <- unlist(header)

#display the histogram
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()