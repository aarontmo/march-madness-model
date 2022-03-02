library(rvest)
library(tidyverse)


url <- "https://sportsdata.usatoday.com/basketball/ncaab/scores?date=2022-03-01&season=2021-2022&filter="

page <- read_html(url)
