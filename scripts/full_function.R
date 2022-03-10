match_predicter <- function(team1, team2){
  
  power_rankings <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/power_rankings.csv")
  team_acry <- read_csv("https://github.com/aarontmo/march-madness-model/raw/master/team_acry.csv")
  acry <- team_acry %>% 
    pull(Abbreviation)
  
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
    str_replace("[:upper:]", "")
    
  teams <- dat_clean %>% 
    select(TEAM) %>% 
    filter(TEAM %in% c(team1, team2)) %>% 
    pull(TEAM)
  
  probs <- dat_clean %>% 
    select(magic_number, TEAM) %>% 
    filter(TEAM %in% teams) %>% 
    pull(magic_number)
  
  sample(teams, 1, prob = probs)
  
  
  # make a round column, and 1/0 win column
  

}

