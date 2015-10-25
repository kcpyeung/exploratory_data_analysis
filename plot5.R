nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

mobile_id <- subset(scc, grepl("Mobile", EI.Sector), c(SCC))
mobile_pm25_in_baltimore_city <- nei[nei$SCC %in% as.matrix(mobile_id) & nei$Pollutant == "PM25-PRI" & nei$fips == "24510",]
rm(scc)
rm(nei)
rm(mobile_id)

total_by_year <- aggregate(mobile_pm25_in_baltimore_city$Emissions, by=list(mobile_pm25_in_baltimore_city$year), sum)
names(total_by_year) <- c("year", "total_mobile_emissions_in_baltimore_city")

png(filename="plot5.png")
plot(total_by_year, type="b")
dev.off()
