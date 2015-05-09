csv<-read.csv('household_power_consumption.txt', sep = ';', na.strings='?')
csv<-csv[csv$Date == '1/2/2007' | csv$Date == '2/2/2007',]
csv_clean<-csv[,2:9]
csv_clean[,1]<-as.POSIXct(strptime(paste(csv[,1],csv[,2]), format='%d/%m/%Y %H:%M:%S'))
rm(csv)
plot(csv_clean$Time, csv_clean$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png, file = "plot2.png")
dev.off()