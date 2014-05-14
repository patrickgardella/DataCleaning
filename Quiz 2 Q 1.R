#https://github.com/hadley/httr/blob/master/demo/oauth2-github.r

library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("DataCleaning", key="26bfe7316ed81c2c5e8b", secret="40bda710c06fec05eaeb304eb33416cce85377fc")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
#GET /repos/:owner/:repo
req <- GET("https://api.github.com/repos/jtleek/datasharing", config(token = github_token))
stop_for_status(req)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
print(json2$created_at)
#[1] "2013-11-07T13:25:07Z"