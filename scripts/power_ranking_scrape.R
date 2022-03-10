# power rankings scrape
library(tidyverse)
library(rvest)
url_base <- "https://www.espn.com/mens-college-basketball/bpi/_/view/overview/season/2022/page/"

full_dat <- tibble()
for(i in seq(1,8)){
  url = str_c(url_base, i)
  
  page = read_html(url)
  
  tabs <- page %>% 
    html_elements("table") 
    
  tab <- tabs[2] %>% 
    html_table()
  
  full_dat <- bind_rows(full_dat, tab)
}

url2 <- "https://www.reddit.com/r/CFB/wiki/abbreviations/"

page2 <- read_html(url2)

team_acry <- page2 %>% 
  html_element("table") %>% 
  html_table() %>% 
  filter(Team != "")

write_csv(team_acry, "team_acry.csv")
write_csv(full_dat, "power_rankings.csv")
