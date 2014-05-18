fileName <- "./data/ss06hid.csv"

if (!file.exists("./data")) { dir.create("./data") }

if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileURL, destfile = fileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

hid <- read.csv(fileName)

print(strsplit(names(hid), "wgtp")[123])
#[1] ""   "15"