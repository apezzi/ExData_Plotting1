#create data frame from file and subset the data from 1/2/2007 and 2/2/2007
aux<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na="?")
df<-subset(aux,aux$Date %in% c("1/2/2007","2/2/2007"))

#create vector POSIXlt class from time adn date fields
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()