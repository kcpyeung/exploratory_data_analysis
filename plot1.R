nei <- readRDS("summarySCC_PM25.rds")

pm25 <- subset(nei, Pollutant == "PM25-PRI")
rm(nei)

total_pm25_by_year <- aggregate(pm25$Emissions, by=list(pm25$year), sum)
names(total_pm25_by_year) <- c("year", "total_pm25")
rm(pm25)

png(filename="plot1.png")
plot(total_pm25_by_year, type="b")
dev.off()
