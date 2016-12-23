install.packages(c("devtools", "rjson", "bit64", "httr", "twitteR"))
install.packages(c("syuzhet", "lubridate", "ggplot2", "scales", "reshape2", "dplyr"))
install.packages("base64enc")

library(devtools)
library(twitteR)
library(httr)
library(base64enc)
library(rjson)
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr )

api_key <- "API Key here"
api_secret <- "API Secret here"
access_token <- "Access Token here"
access_token_secret <- "Access Token Secret here"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# example tweets <- searchTwitter("Sample1 OR Sample2 OR 'Sample Three', n=100, lang="en", since="2014-08-20")
# Use the searchTwitter function to only get tweets within 50 miles of Los Angeles
# tweets_geolocated <- searchTwitter("Sample1 OR Sample2 OR 'Sample Three', n=100, lang="en", geocode="34.049933,-118.240843,50mi", since="2014-08-20")
# tweets_geolocated.df <- twListToDF(tweets_geolocated)

tweets_geolocated <- searchTwitter("disneyland", n=1500, geocode="33.812350,-117.918996,1mi")
tweets_geolocated.df <- twListToDF(tweets_geolocated)

tweets_geolocated.df$text <- gsub("[^[:alnum:]///' ]", "", tweets_geolocated.df$text)

#remove special characters from tweet text field
gsub("[^[:alnum:]///' ]", "", tweets_geolocated.df$text)

sentiment <- get_nrc_sentiment(tweets_geolocated.df$text)
tweets_geolocated.df <- cbind(tweets_geolocated.df, sentiment)

