#create data frame from zip file and subset the data from 1/2/2007 and 2/2/2007
aux<-read.table(unz("data.zip","household_power_consumption.txt"),header=TRUE,sep=";",na="?")
df<-subset(aux,aux$Date %in% c("1/2/2007","2/2/2007"))

#create vector POSIXlt class from time adn date fields
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 


plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
#add  the other two series of data to the third plot
lines(datetime, df$Sub_metering_2, type="l", col="red")
lines(datetime, df$Sub_metering_3, type="l", col="blue")
#add legend withou border bty="n"
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5,bty="n", col=c("black", "red", "blue"))

plot(datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()