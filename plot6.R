library(dplyr)
library(ggplot)
library(reshape2)


NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

motor <- SCC[grep("on-road", SCC$EI.Sector, ignore.case = T),]
motorNEI <- NEI %>% inner_join(., motor)

LAmotorNEI <- subset(motorNEI, motorNEI$fips == "06037")
LAfinal <- group_by(LAmotorNEI, year) %>% summarize(Emissions = sum(Emissions))

newdf <- left_join(finalmotor, LAfinal, by = "year")

names(newdf) <- c("year","Baltimore", "Los_Angeles")

melted <- melt(newdf, id = "year")

ggplot(data = melted, aes(x = year, y = value, col = variable)) + geom_point()+ facet_grid(.~variable)+geom_line() + labs(x = "Year", y = "Emissions (in tons)", title = "Emissions from motor vehicles in Baltimore and Los Angeles City")+geom_text(aes(label = round(value), hjust = .5, vjust = -.3))
