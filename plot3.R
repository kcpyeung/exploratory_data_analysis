nei <- readRDS("summarySCC_PM25.rds")

pm25_in_baltimore_city <- subset(nei, Pollutant == "PM25-PRI" & fips == "24510")
rm(nei)

total_pm25_by_year <- aggregate(pm25_in_baltimore_city$Emissions, by=list(pm25_in_baltimore_city$year, pm25_in_baltimore_city$type), sum)
names(total_pm25_by_year) <- c("year", "type", "total_pm25")
rm(pm25_in_baltimore_city)

png(filename="plot3.png")
g <- ggplot(total_pm25_by_year, aes(year, total_pm25))
g <- g + geom_point(aes(color = type))
print(g)
dev.off()

