if (!file.exists("./data")) { dir.create("./data") }

fileName <- "./data/GDP.csv"
if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  dateDownloaded <- date()
}

GDP <- read.csv(fileName, stringsAsFactors=FALSE)
colnames(GDP) <- c("CountryCode","Ranking","V3","Country","GDP","Footnotes", "V5", "V6", "V7", "V8")
GDP <- GDP[5:195,]
GDP$GDP <- gsub(",", "", GDP$GDP)
GDP$GDP <- as.integer(as.character(GDP$GDP),na.rm = TRUE)
print(mean(GDP$GDP,na.rm=TRUE))
#[1] 293700.3

countryNames <- GDP$Country
print(countryNames[grep("^United",countryNames)])