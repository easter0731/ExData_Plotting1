##ExData_Plotting1
##================
##Plotting Assignment 1 for Exploratory Data Analysis

##read all data first
initial <- read.table("household_power_consumption.txt", header = TRUE, sep=";", comment.char = "",nrow = 100)
classes <- sapply(initial, class)
ConsumptionData <- read.table("household_power_consumption.txt", header = TRUE, sep=";", comment.char = "", colClasses = "character")

## subset 
righttime<- ConsumptionData[[1]]=="1/2/2007" | ConsumptionData[[1]]=="2/2/2007"
PlotData <- ConsumptionData[righttime,]

GlobalActivePower <- as.numeric(PlotData$Global_active_power)
Sub_metering_1 <- as.numeric(PlotData$Sub_metering_1)
Sub_metering_2 <- as.numeric(PlotData$Sub_metering_2)
Sub_metering_3 <- as.numeric(PlotData$Sub_metering_3)
Voltage <- as.numeric(PlotData$Voltage)
Global_reactive_power <- as.numeric(PlotData$Global_reactive_power)
x<- c(1:2880)

##plot
png("plot4.png")
par(mfcol=c(2,2))
plot(y=GlobalActivePower, x=x, xlab="", ylab="Global Active Power", type="l",lty=1, xaxt = "n")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))

plot(y=Sub_metering_1, x=x, xlab="", ylab="Energy sub metering", type="n",xaxt = "n")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
lines(x=x, y=Sub_metering_1, col="black" )
lines(x=x, y=Sub_metering_2, col="red" )
lines(x=x, y=Sub_metering_3, col="blue" )
legend("topright", lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, bty = "n" )

plot(x=x, y=Voltage, xlab="datatime", ylab="Voltage",type="l",xaxt = "n")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))

plot(x=x, y=Global_reactive_power, xlab="datatime", ylab="Global_reactive_power",type="l",xaxt = "n")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
dev.off()

