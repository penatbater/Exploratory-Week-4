
library(dplyr)
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

Q1 <- group_by(NEI, NEI$year) %>% summarise(Emissions = sum(Emissions))
plot(Q1$`NEI$year`, Q1$Emissions, pch = 20, xlab = "Year", ylab = "Emissions (in tons)")
lines(Q1$`NEI$year`, Q1$Emissions)
