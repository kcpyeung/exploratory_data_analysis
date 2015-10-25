nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

mobile_id <- subset(scc, grepl("Mobile", EI.Sector), c(SCC))
mobile_pm25_in_baltimore_city <- nei[nei$SCC %in% as.matrix(mobile_id) & nei$Pollutant == "PM25-PRI" & nei$fips == "24510",]
mobile_pm25_in_la <- nei[nei$SCC %in% as.matrix(mobile_id) & nei$Pollutant == "PM25-PRI" & nei$fips == "06037",]
rm(scc)
rm(nei)
rm(mobile_id)

mobile_in_both_cities = rbind(mobile_pm25_in_baltimore_city, mobile_pm25_in_la)
rm(mobile_pm25_in_baltimore_city)
rm(mobile_pm25_in_la)

total_by_year_by_city <- aggregate(mobile_in_both_cities$Emissions, by=list(mobile_in_both_cities$year, mobile_in_both_cities$fips), sum)
names(total_by_year_by_city) <- c("year", "city", "mobile_emissions")

library(ggplot2)
png(filename="plot6.png")
qplot(year, mobile_emissions, data=total_by_year_by_city, color=city)
dev.off()
