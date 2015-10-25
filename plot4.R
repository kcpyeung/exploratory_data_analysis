nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

coal_id <- subset(scc, grepl("Coal", EI.Sector), c(SCC))
coal <- nei[nei$SCC %in% as.matrix(coal_id),]
rm(coal_id)
rm(scc)
rm(nei)

sum_by_year <- aggregate(coal$Emissions, by=list(coal$year), sum)
names(sum_by_year) <- c("year", "total_coal_emission")

png(filename="plot4.png")
plot(sum_by_year$year, sum_by_year$total_coal_emission, type="b")
dev.off()
