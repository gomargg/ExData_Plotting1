setwd("C:/Users/Goran/Desktop/Exploratory_Data_Analysis")


tab <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";")
tab$Date = as.character(tab$Date)

vec11 <- subset(tab, Date == "1/2/2007")$Sub_metering_1
vec11 <- vec11[vec11 != "?"]
vec11 <- as.numeric(as.character(vec11))


vec12 <- subset(tab, Date == "2/2/2007")$Sub_metering_1
vec12 <- vec12[vec12 != '?']
vec12 <- as.numeric(as.character(vec12))

SM1 <- c(vec11, vec12)

vec21 <- subset(tab, Date == "1/2/2007")$Sub_metering_2
vec21 <- vec21[vec21 != '?']
vec21 <- as.numeric(as.character(vec21))


vec22 <- subset(tab, Date == "2/2/2007")$Sub_metering_2
vec22 <- vec22[vec22 != '?']
vec22 <- as.numeric(as.character(vec22))

SM2 <- c(vec21, vec22)

vec31 <- subset(tab, Date == "1/2/2007")$Sub_metering_3
vec31 <- vec31[vec31 != '?']
vec31 <- as.numeric(as.character(vec31))


vec32 <- subset(tab, Date == "2/2/2007")$Sub_metering_3
vec32 <- vec32[vec32 != '?']
vec32 <- as.numeric(as.character(vec32))

SM3 <- c(vec31, vec32)

png("plot3.png")

plot(SM1, xlab="", xaxt = 'n', type='l', ylab="Energy sub metering")
points(SM2, type='l', col = "Red")
points(SM3, type='l', col = "Blue")
axis(1, c(0, length(SM1)/2, length(SM1)), c("Thu", "Fri", "Sat"))
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() 

