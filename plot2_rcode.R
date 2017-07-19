## Getting full dataset

pwr_consump <- read.csv("C:/Users/armys/OneDrive/Documents/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

pwr_consump$Date <- as.Date(pwr_consump$Date, format="%d/%m/%Y")



## Subsetting the data

subset_pwr_consump <- subset(pwr_consump, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(pwr_consump)



## Converting dates

convert_pwr_consump <- paste(as.Date(subset_pwr_consump$Date), subset_pwr_consump$Time)

subset_pwr_consump$Datetime <- as.POSIXct(convert_pwr_consump)


##Plot 2

plot(subset_pwr_consump$Global_active_power~subset_pwr_consump$Datetime, type="l",
     
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="C:/Users/armys/OneDrive/Documents/Coursera Class/Data Science Specialization/Exploring Data/Week 1/plot2.png", height=480, width=480)

dev.off()