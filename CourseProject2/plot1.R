Sys.setlocale("LC_TIME", "English")
library("data.table")


## if the file is not in the working directory, it is downloaded and unzipped##
if(!file.exists("./summarySCC_PM25.rds") | !file.exists("./Source_Classification_Code.rds"))
{ download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                destfile = "exdata_data_FBEI_data.zip")
  unzip("./exdata_data_FBEI_data.zip")
}

## This first line will likely take a few seconds. Be patient!
NEI <- data.table(readRDS("summarySCC_PM25.rds"))


sumDATA <- aggregate(Emissions ~ year,NEI, sum)
png("2plot1.png",width = 480, height = 480)
with(sumDATA,barplot(Emissions/(10^6), ylab = 'PM2.5 Emissions(in megatons)',xlab = 'Year',col=year,names.arg=year))
title(main="PM2.5 emission from all sources by Year")
dev.off()
