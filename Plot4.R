## Reading the file :
  Energy1strecord <- read.table("household_power_consumption.txt", header = TRUE , nrow =1 , stringsAsFactor = FALSE , sep =";")
  EnergyAll <- read.table("household_power_consumption.txt", header = FALSE ,skip = 1, sep =";" ,stringsAsFactor = FALSE ,col.names = colnames(Energy1strecord) )
  
## Converting to Date 
  EnergyAll$Date1 <- as.Date(EnergyAll$Date , "%d/%m/%Y") 
  EnergyAll$Global_active_power <- as.numeric(EnergyAll$Global_active_power)
 
## Get February 1st and 2nd 2007 data .  
  
  FebEnergy<- subset(EnergyAll, Date1 == '2007-02-01' | Date1 == '2007-02-02')
  FebEnergy$Voltage_num <- as.numeric(FebEnergy$Voltage) 
  FebEnergy$Global_reactive_power <- as.numeric(FebEnergy$Global_reactive_power) 
  
  FebEnergy$DateTime <- paste(FebEnergy$Date,FebEnergy$Time)
  FebEnergy$DateTime1 <- strptime(FebEnergy$DateTime , "%d/%m/%Y %H:%M:%S") 
  
  FebEnergy$Submtr1 <- as.numeric(FebEnergy$Sub_metering_1)
  FebEnergy$Submtr2 <- as.numeric(FebEnergy$Sub_metering_2)
  FebEnergy$Submtr3 <- as.numeric(FebEnergy$Sub_metering_3)

## Ploting 4 plots 
  par(mfrow = c(2,2))
  plot(FebEnergy$DateTime1, FebEnergy$Global_active_power , type = "n",xlab = " ",ylab = "Global Active Power(kilowatts)")
  
  lines(FebEnergy$DateTime1, FebEnergy$Global_active_power , type = "l" )
  plot(FebEnergy$DateTime1, FebEnergy$Voltage_num , type = "n", xlab = "DateTime", ylab = "Voltage" )
  lines(FebEnergy$DateTime1, FebEnergy$Voltage_num , type = "l" )
    
  plot(FebEnergy$DateTime1, FebEnergy$Submtr1 ,pch = "-", type = "n",xlab = " ",ylab = "Energy sub metering")
  
  lines(FebEnergy$DateTime1, FebEnergy$Submtr1 , type = "l" )
  lines(FebEnergy$DateTime1, FebEnergy$Submtr2 , type = "l" , col ="red")
  lines(FebEnergy$DateTime1, FebEnergy$Submtr3 , type = "l" , col="blue")
  legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex = 0.5, col = c("black","red","blue"), pch = "-")
  
  plot(FebEnergy$DateTime1 , FebEnergy$Global_reactive_power,type = "n", xlab ="DateTime", ylab = "Global_reactive_power")
  lines(FebEnergy$DateTime1, FebEnergy$Global_reactive_power , type = "l" )
  
  dev.copy(png,"plot4.png", width = 480 , height = 480)
  dev.off()
  
