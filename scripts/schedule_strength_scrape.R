# scrape strength of schedule atat

library(tidyverse)
library(rvest)

url <- "https://www.teamrankings.com/ncaa-basketball/ranking/schedule-strength-by-other"

page <- read_html(url)

strength_schedule <- page %>% 
  html_element("table") %>% 
  html_table() %>% 
  rename("strength" = "Rating")

write_csv(strength_schedule, "schedule_strength.csv")
