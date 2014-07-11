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

Sub_metering_1 <- as.numeric(PlotData$Sub_metering_1)
Sub_metering_2 <- as.numeric(PlotData$Sub_metering_2)
Sub_metering_3 <- as.numeric(PlotData$Sub_metering_3)
x<- c(1:2880)

##plot
png("plot3.png")
plot(y=Sub_metering_1, x=x, xlab="", ylab="Energy sub metering", type="n",xaxt = "n")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
lines(x=x, y=Sub_metering_1, col="black" )
lines(x=x, y=Sub_metering_2, col="red" )
lines(x=x, y=Sub_metering_3, col="blue" )
legend("topright", lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()
