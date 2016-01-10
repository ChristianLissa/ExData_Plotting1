
# Load data
setwd("~/Coursera/Exploratory data analysis/week1")
hpc_raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset Data
hpc <- hpc_raw[hpc_raw$Date %in% c("1/2/2007", "2/2/2007"), ]
# head(hpc)

# Plot data
png("plot1.png", width=480, height=480)
hist(as.numeric(hpc$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
