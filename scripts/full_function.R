match_predicter <- function(team1, team2){
  
  library(tidyverse)
  
  team1 <- "Gonzaga_Bulldogs"
  team2 <- "GeorgiaState_Panthers"
  
  # process team names
  team1_clean <- tolower(unlist(str_split(team1, "_"))[1])
  team2_clean <- tolower(unlist(str_split(team2, "_"))[1])
  team_names <- c(team1_clean, team2_clean)
  
  power_rankings <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/power_rankings.csv", show_col_types = FALSE)
  
  # normalize all data between 0-1, good = 1
  dat_clean <- power_rankings %>% 
    mutate(bpi = 1 - (`BPI RK` - min(`BPI RK`))/(max(`BPI RK`) - min(`BPI RK`)),
           sos = 1 - (`SOS RK` - min(`SOS RK`))/(max(`SOS RK`) - min(`SOS RK`)),
           sor = 1 - (`SOR RK` - min(`SOR RK`))/(max(`SOR RK`) - min(`SOR RK`))) %>% 
    select(TEAM, bpi, sos, sor) %>% 
    pivot_longer(cols = c(bpi, sos, sor), names_to = "metric") %>% 
    group_by(TEAM) %>% 
    # make this a weighted mean
    summarise(magic_number = mean(value)) %>% 
    mutate(TEAM = str_replace(TEAM, "[:blank:]", ""),
           TEAM = tolower(TEAM)) %>% 
    filter(grepl(team_names[1], TEAM) | grepl(team_names[2], TEAM))
    
  teams <- dat_clean %>% 
    select(TEAM) %>% 
    pull(TEAM)
  
  probs <- dat_clean %>% 
    select(magic_number) %>% 
    pull(magic_number)
  
  sample(teams, 1, prob = probs)
  
  
  # make a round column, and 1/0 win column
  

}


team1 <- "Gonzaga_Bulldogs"
team2 <- "GeorgiaState_Panthers"

match_predicter(team1, team2)


















