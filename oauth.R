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
