library(dplyr)
library(ggplot)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips == "24510")

pointbalt <- group_by(baltimore, year, type) %>% summarise(Emissions = sum(Emissions))

ggplot(pointbalt, aes(x = year, y = Emissions, color = type, group = type)) + geom_point() + geom_line() + labs(x = "Year", y = "Emissions (in tons)", title = "Emissions by type in Baltimore City") + geom_text(aes(label = round(Emissions), hjust = 0, vjust = 0))
