match_predicter <- function(team1, team2){
  
  # load libraries
  library(tidyverse)
  
  # load data
  reg_season <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/raw_data/cbb.csv")
  # write web scrape in separate script to get these, links on github
  
  schedule_strength <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/schedule_strength.csv")
  # just use odds to win championship
  #
  
  bracket_predictions <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/bracket_predictions.csv")
  
  
  
  # make a round column, and 1/0 win column
  
  ex_reg_season <- reg_season %>% 
    select(POSTSEASON, YEAR, WAB) %>% 
    mutate(wab_normal = (WAB - min(WAB))/(max(WAB) - min(WAB)))
}




dat <- seq(1,16)

norm <- 1 - (dat - min(dat))/(max(dat) - min(dat))


sample(c(0,1), 1, prob = c(0.94, 0.72))