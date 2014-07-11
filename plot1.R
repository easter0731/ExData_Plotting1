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

png("plot1.png")
hist(GlobalActivePower, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="OrangeRed")
dev.off()