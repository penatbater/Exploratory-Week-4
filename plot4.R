library(dplyr)
library(ggplot)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

coalcase <- SCC[grep("coal", SCC$Short.Name, ignore.case = T),]
a <- NEI %>% inner_join(., coalcase)
b <- group_by(a, year) %>% summarize(Emissions = sum(Emissions))

ggplot(b, aes(x = year, y = Emissions)) + geom_point() + geom_line() + labs(title = "Emissions from Coal")
