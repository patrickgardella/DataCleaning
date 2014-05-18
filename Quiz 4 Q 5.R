library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)
amzn <- data.frame(date=index(amzn), coredata(amzn))
amzn$DOW <- format(amzn$date,"%Y %a")
print(length(grep("2012",amzn$date)))

print(length(grep("2012 Mon",amzn$DOW)))
#250, 47