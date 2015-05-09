csv<-read.csv('household_power_consumption.txt', sep = ';', na.strings='?')
csv<-csv[csv$Date == '1/2/2007' | csv$Date == '2/2/2007',]
csv_clean<-csv[,2:9]
csv_clean[,1]<-as.POSIXct(strptime(paste(csv[,1],csv[,2]), format='%d/%m/%Y %H:%M:%S'))
rm(csv)
plot(csv_clean$Time, csv_clean$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering', col = 'Black')
lines(csv_clean$Time, csv_clean$Sub_metering_2, type = 'l', xlab = '', ylab = 'Energy sub metering', col = 'Red')
lines(csv_clean$Time, csv_clean$Sub_metering_3, type = 'l', xlab = '', ylab = 'Energy sub metering', col = 'Blue')
legend('topright', c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), col=c('Black', 'Red', 'Blue'),  lty=1, cex = 0.5)
dev.copy(png, file = "plot3.png")
dev.off()