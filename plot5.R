library(dplyr)
library(ggplot)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

motor <- SCC[grep("on-road", SCC$EI.Sector, ignore.case = T),]

motorNEI <- NEI %>% inner_join(., motor)

newmotorNEI <- subset(motorNEI, motorNEI$fips == "24510")

finalmotor <- group_by(newmotorNEI, year) %>% summarise(Emissions = sum(Emissions))

ggplot(finalmotor, aes(x = year, y = Emissions)) + geom_point() + geom_line() + labs(x = "Year", y = "Emissions (in tons)", title = "Motor Emissions in Baltimore City") + geom_text(aes(label = round(Emissions, 3), hjust = 0, vjust = 0))