#downloading the data
fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="./Dataset.zip",method="auto")
unzip("./Dataset.zip")
#ls
list.files("./")
#reading the file 
power<-read.table("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";",stringsAsFactors = F)
#selecting dates
pow<-power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
#changing to date and time classes
pow<-transform(pow, Date=as.Date(Date,format="%d/%m/%Y"))
pow<-transform(pow, Time=strptime(paste(pow$Date,pow$Time),format="%Y-%m-%d %H:%M:%S"))
str(pow)
#plot 4 plot4.R
par(mfrow=c(2,2))
#1
with(pow,plot(Time,Global_active_power,main=NULL,ylab="Global Active Power (kilowatts)",xlab="",type="l"))
#2
with(pow,plot(Time,Voltage,main=NULL,ylab="Voltage",xlab="datetime",type="l"))
#3
with(pow,plot(Time,Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(pow,lines(Time,Sub_metering_2,type="l",col="red"))
with(pow,lines(Time,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
#4
with(pow,plot(Time,Global_reactive_power,main=NULL,ylab="Global_reactive_power",xlab="datetime",type="l"))
dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()