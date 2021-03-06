library(dplyr)
hpc <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";",na.strings = "?")
hpc_df <- tbl_df(hpc)
h <- filter(hpc_df, Date == "1/2/2007"| Date == "2/2/2007")
h <- mutate(h, datetime = paste(Date,Time,sep=" "))
h <- mutate(h, datetime = as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S")))

png("plot2.png")
plot( h$datetime, h$Global_active_power,
     type="l", ylab = "Global Active Power(kilowatts")
dev.off()


