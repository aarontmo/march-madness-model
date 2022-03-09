library(tidyverse)
library(rvest)
library(janitor)


url <- "https://www.teamrankings.com/ncaa-tournament/bracket-predictions/"

page <- read_html(url)

bracket_predictions <- page %>% 
  html_element("table") %>% 
  html_table(header = FALSE) %>% 
  row_to_names(row_number = 2)


write_csv(bracket_predictions, "bracket_predictions.csv")

