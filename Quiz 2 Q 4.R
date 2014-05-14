con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
htmlCode

print("10:")
print(nchar(htmlCode[10]))

print("20:")
print(nchar(htmlCode[20]))

print("30:")
print(nchar(htmlCode[30]))

print("100:")
print(nchar(htmlCode[100]))