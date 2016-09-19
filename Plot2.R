## Reading the file :
  Energy1strecord <- read.table("household_power_consumption.txt", header = TRUE , nrow =1 , stringsAsFactor = FALSE , sep =";")
  EnergyAll <- read.table("household_power_consumption.txt", header = FALSE ,skip = 1, sep =";" ,stringsAsFactor = FALSE ,col.names = colnames(Energy1strecord) )
  
## Converting to Date 
  EnergyAll$Date1 <- as.Date(EnergyAll$Date , "%d/%m/%Y") 
  EnergyAll$Global_active_power <- as.numeric(EnergyAll$Global_active_power)
## Get data only for Feb 1st and 2nd 2007.  
  FebEnergy<- subset(EnergyAll, Date1 == '2007-02-01' | Date1 == '2007-02-02')
## Concatenate Date and Time 
  FebEnergy$DateTime <- paste(FebEnergy$Date,FebEnergy$Time)
  
   FebEnergy$DateTime1 <- strptime(FebEnergy$DateTime , "%d/%m/%Y %H:%M:%S")
## Plot 
  plot(FebEnergy$DateTime1, FebEnergy$Global_active_power , type = "n",xlab = " ",ylab = "Global Active Power(kilowatts)")
  
  lines(FebEnergy$DateTime1, FebEnergy$Global_active_power , type = "l" )
## Copy to png  
  dev.copy(png,"plot2.png", width = 480 , height = 480)
  dev.off()
  

  
