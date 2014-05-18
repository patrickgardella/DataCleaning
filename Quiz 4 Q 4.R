

# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Load the educational data from this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
# 
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank. What is the 13th country in the resulting data frame? 
# 
# Original data sources: 
#   http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats

if (!file.exists("./data")) { dir.create("./data") }

fileName <- "./data/GDP.csv"
if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  dateDownloaded <- date()
}

fileName2 <- "./data/FEDSTATS_Country.csv"
if (!file.exists(fileName2)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileURL, destfile = fileName2, method="curl")
  dateDownloaded <- date()
}

GDP <- read.csv(fileName, header=FALSE, stringsAsFactors=FALSE)
colnames(GDP) <- c("CountryCode","Ranking","V3","Country","GDP","Footnotes", "V5", "V6", "V7", "V8")
GDP <- GDP[6:195,]
GDP$Ranking <- as.integer(GDP$Ranking)
GDP$GDP <- gsub(",", "", GDP$GDP)
GDP$GDP <- as.integer(as.character(GDP$GDP))

new <- GDP[order(GDP$GDP, decreasing = TRUE),]
new2 <- GDP[order(GDP$Ranking, decreasing = FALSE),]

Stats <- read.csv(fileName2, stringsAsFactors=FALSE)

mergedData <- merge(GDP, Stats,by="CountryCode", all = FALSE)
mergedData$GDP <- as.integer(as.character(mergedData$GDP))

print("Question 4")
print(length(grep("Fiscal year end: June", mergedData$Special.Notes)))
#[1] 13
