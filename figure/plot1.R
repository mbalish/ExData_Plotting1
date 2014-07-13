powerd<-read.table("./household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#above reads date (in local directory into powerd)
#the following correct variables to the right type
powerd$Sub_metering_3<-as.numeric(powerd$Sub_metering_3)
powerd$Sub_metering_2<-as.numeric(powerd$Sub_metering_2)
powerd$Sub_metering_1<-as.numeric(powerd$Sub_metering_1)
powerd$Global_intensity<-as.numeric(powerd$Global_intensity)
powerd$Global_reactive_power<-as.numeric(powerd$Global_reactive_power)
powerd$Global_active_power<-as.numeric(powerd$Global_active_power)
powerd$Voltage<-as.numeric(powerd$Voltage)
#corrects date and time
powerd$Time <- strptime(paste(powerd$Date, powerd$Time), "%d/%m/%Y %H:%M:%S")
powerd$Date<-as.Date(powerd$Date,format="%d/%m/%Y")
#powerd$Time<-strptime(powerd$Time,format="%H:%M:%S")
#subsets ACCORDING TO CORRECT DATES 
poopie<-subset(powerd,(powerd$Date=="2007-02-01"))
poopie1<-subset(powerd,(powerd$Date=="2007-02-02"))
# COMBINES THE TWO DAYS OF DATA INTO pOOPIe3
poopie3<-rbind(poopie,poopie1)

#
# this gives a dataframe called poopie3 with the appropriate dates and variables

png(file="plot1.png",width=480,height=480)
hist(poopie3$Global_active_power,main="Global_Active_Power",xlab="Global_active_power",col="red")
dev.off()
