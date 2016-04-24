#create data frame from zip file and subset the data from 1/2/2007 and 2/2/2007
aux<-read.table(unz("data.zip","household_power_consumption.txt"),header=TRUE,sep=";",na="?")
df<-subset(aux,aux$Date %in% c("1/2/2007","2/2/2007"))

#creates png in working directory 
png("plot1.png",width=480,height = 480)
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()