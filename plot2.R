library(dplyr)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips == "24510")
newbalt <- group_by(baltimore, year) %>% summarise(Emissions = sum(Emissions))

plot(newbalt$year, newbalt$Emissions, pch = 20, xlab = "Year", ylab = "Emissions (in tons)", main = "Baltimore City")

lines(newbalt$year, newbalt$Emissions)