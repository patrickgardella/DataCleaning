fileName <- "./data/ss06hid.csv"

if (!file.exists(fileName)) {
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = fileName, method="curl")
list.files("./data")
dateDownloaded <- date()
}

library(plyr)
hid <- read.csv(fileName)
count(hid, vars = "VAL")
table(hid$VAL)