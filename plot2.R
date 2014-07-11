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
x<- c(1:2880)

##plot
png("plot2.png")
plot(y=GlobalActivePower, x=x, xlab="", ylab="Global Active Power (kilowatts)", type="l",lty=1, xaxt = "n")
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri","Sat"))
dev.off()