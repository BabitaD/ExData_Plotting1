data <- read.table("../data/household_power_consumption.txt", sep = ";"
                   , header = FALSE
                   , col.names = c("date","time","global_active_power","global_reactive_power",
                                   "voltage","global_intensity","sub_metering_1","sub_metering_2",
                                   "sub_metering_3")
                   , skip = 66637
                   , nrows = 2880
                   , na.strings = "?")

data$datetime = strptime(paste(data$date, data$time), format = "%d/%m/%Y %H:%M:%S")


with(data, plot(datetime, global_active_power,type = "l"
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab = ""))

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 
dev.off()
