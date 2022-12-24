
hpc<-read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")


DateAndTime <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc<-cbind(hpc,DateAndTime)

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$Time <- format(hpc$Time, format="%H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
hpc$Voltage <- as.numeric(hpc$Voltage)
hpc$Global_intensity <- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)
head(hpc)

february<-subset(hpc, Date=="2007-02-01" | Date== "2007-02-02")

png("plot2.png", width=480, height=480)
with(february, plot(DateAndTime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)"))
dev.off()
