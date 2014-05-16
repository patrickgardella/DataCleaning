#install.packages("jpeg")

library(jpeg)

fileName <- "./data/jeff.jpg"

if (!file.exists("./data")) { dir.create("./data") }

if (!file.exists(fileName)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
  download.file(fileURL, destfile = fileName, method="curl")
  list.files("./data")
  dateDownloaded <- date()
}

# Using the jpeg package read in the following picture of your instructor into R 

# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 

# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

img <- readJPEG("./data/jeff.jpg", TRUE)

print(quantile(img, c(.30, .80)))
#-15259150 -10575416 