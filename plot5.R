## Task 5: How have emissions from motor vehicle sources changed from 1999-2008
## in Baltimore City?

## Read source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Generate vector of SCC's corresponding to motor vehicle-related sources
vehicleSCC <- SCC$SCC[grep("Vehicles", as.character(SCC$EI.Sector), fixed = TRUE)]
## Find total annual emissions from motor vehicle-related sources in Baltimore City,
## MD, and render a line plot in PNG format.
totalVehEmissionsBalt <- 
    aggregate(data = subset(NEI, SCC %in% vehicleSCC & fips == "24510"),
              Emissions ~ year, FUN = sum)
png("plot5.png")
with(totalVehEmissionsBalt,
     plot(year, Emissions,
          xlab = "Year", ylab = "Annual motor vehicle PM2.5 emissions (tons)",
          type = "b", col = "blue", pch=19))
title(main = "Annual Motor Vehicle PM2.5 Emissions\n in Baltimore City, MD (1999-2008)")
dev.off()