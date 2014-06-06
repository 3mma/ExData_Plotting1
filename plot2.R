
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

#plot 2 plot2.R
with(pow,plot(Time,Global_active_power,main=NULL,ylab="Global Active Power (kilowatts)",xlab="",type="l"))
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()


