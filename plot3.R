rawData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings=c('?'))
rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")
data <- rawData[rawData$DateTime>=strptime('2007-02-01', format='%Y-%m-%d') & rawData$DateTime<strptime('2007-02-03', format='%Y-%m-%d'),]
plot(data$DateTime, data$Sub_metering_1, type='l', xlab='', ylab='Engery sub metering', col='black')
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.copy(png, file='plot3.png')
dev.off()