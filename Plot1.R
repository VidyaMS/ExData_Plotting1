## Reading the file :
  Energy1strecord <- read.table("household_power_consumption.txt", header = TRUE , nrow =1 , stringsAsFactor = FALSE , sep =";")
  EnergyAll <- read.table("household_power_consumption.txt", header = FALSE ,skip = 1, sep =";" ,stringsAsFactor = FALSE ,col.names = colnames(Energy1strecord) )
  
## Converting to Date 
  EnergyAll$Date1 <- as.Date(EnergyAll$Date , "%d/%m/%Y") 
  EnergyAll$Global_active_power <- as.numeric(EnergyAll$Global_active_power)
 
  
  FebEnergy<- subset(EnergyAll, Date1 == '2007-02-01' | Date1 == '2007-02-02')
  hist(FebEnergy$Global_active_power , col ="red", main = "Global Active Power", xlab = "Global Active Power(kilowatts")
  
  dev.copy(png,"plot1.png", width = 480 , height = 480)
  dev.off()
