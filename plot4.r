data <- read.table("../data/household_power_consumption.txt", sep = ";"
                   , header = FALSE
                   , col.names = c("date","time","global_active_power","global_reactive_power",
                                   "voltage","global_intensity","sub_metering_1","sub_metering_2",
                                   "sub_metering_3")
                   , skip = 66637
                   , nrows = 2880
                   , na.strings = "?")

data$datetime = strptime(paste(data$date, data$time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2),  mar = c(4, 4, 2.5, 1))
plot(data$datetime, data$global_active_power,type = "l"
     ,ylab = "Global Active Power",xlab = "")

plot(data$datetime, data$voltage,type = "l"
     ,ylab = "Voltage", xlab = "datetime")

with(data, plot(datetime, sub_metering_1, type = "l"
                , xlab = "", ylab = "Energy sub metering" ))
with(data, lines(datetime, sub_metering_2, col = "red"))
with(data, lines(datetime, sub_metering_3, col = "blue"))
legend("topright", pch = NA, lty = c(1,1,1), col = c("black", "red", "blue")
       , legend = c("sub_metering_1", "sub_metering_2","sub_metering_3")
       , cex = 0.70, bty = 'n')

with(data, plot(datetime, global_reactive_power, type = "l"))


dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") 
dev.off()
