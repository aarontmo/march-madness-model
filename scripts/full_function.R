match_predicter <- function(team1, team2, seed1, seed2){
  
  # load libraries
  library(tidyverse)
  
  # load data
  reg_season <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/raw_data/cbb.csv")
  # write web scrape in separate script to get these, links on github
  
  schedule_strength <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/raw_data/schedule_strength.csv")
  # just use odds to win championship
  #odds <- read_csv("")
  
}