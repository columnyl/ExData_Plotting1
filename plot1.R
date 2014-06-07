rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings=c('?'))
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")
data <- rawData[rawData$DateTime>=strptime('2007-02-01', format='%Y-%m-%d') & rawData$DateTime<strptime('2007-02-03', format='%Y-%m-%d'),]
hist(data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.copy(png, file='plot1.png')
dev.off()