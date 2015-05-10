setwd("C:/Users/Goran/Desktop/Exploratory_Data_Analysis")


tab <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";")
tab$Date = as.character(tab$Date)

vec1 <- subset(tab, Date == "1/2/2007")$Global_active_power
vec1 <- vec1[vec1 != "?"]
vec1 <- as.numeric(as.character(vec1))


vec2 <- subset(tab, Date == "2/2/2007")$Global_active_power
vec2 <- vec2[vec2 != '?']
vec2 <- as.numeric(as.character(vec2))


G_A_P <- c(vec1, vec2)

png("plot2.png")

plot(G_A_P, type="l", ylab = "Global Active Power (kilowatts)", xlab="", xaxt = 'n')
axis(1, c(0, length(G_A_P)/2, length(G_A_P)), c("Thu", "Fri", "Sat"))

dev.off() 
