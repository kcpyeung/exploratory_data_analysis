nei <- readRDS("summarySCC_PM25.rds")

pm25_in_baltimore_city <- subset(nei, Pollutant == "PM25-PRI" & fips == "24510")
rm(nei)

total_pm25_by_year <- aggregate(pm25_in_baltimore_city$Emissions, by=list(pm25_in_baltimore_city$year), sum)
names(total_pm25_by_year) <- c("year", "total_pm25")
rm(pm25_in_baltimore_city)

png(filename="plot2.png")
plot(total_pm25_by_year, type="b")
dev.off()
