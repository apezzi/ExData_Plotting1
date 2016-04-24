#create data frame from file and subset the data from 1/2/2007 and 2/2/2007
aux<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na="?")
df<-subset(aux,aux$Date %in% c("1/2/2007","2/2/2007"))

#create vector POSIXlt class from time adn date fields
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, df$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

#add  the other two series of data to the plot

lines(datetime, df$Sub_metering_2, type="l", col="red")
lines(datetime, df$Sub_metering_3, type="l", col="blue")
#add legend to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()