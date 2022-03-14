# scrape team names and seeds

library(tidyverse)
library(rvest)

dat <- read_csv("/Users/aaronmorris/Desktop/R Projects/march-madness-model/team_names.csv")

col2 <- dat %>% 
  select(game, team2) %>% 
  rename("team1" = "team2")
  

team_names <- dat %>% 
  select(team1) %>% 
  bind_rows(col2) %>% 
  filter(!team1 %in% c("Game1", "Game2", "Game3", "Game4")) %>% 
  select(!game) %>% 
  mutate(key = team1) %>% 
  separate(key, into = c("key", "mascot"), sep = "_")
  
  
