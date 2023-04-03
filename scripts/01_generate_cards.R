source(here::here("scripts", "00_helpers.R"))

library(tidyverse)
library(here)
### Dfs 
open_players = read.csv(here("open_profiles.csv"), na.strings=c("","NA")) %>% 
  filter(!is.na(First.Name))

make_cards(open_players, "cadetblue1", "all_plots")


#####
advanced_players = open_players %>% 
  filter(Overall.Skill == "Advanced")
make_cards(advanced_players, "darksalmon", "advanced_players")


#####
new_players = read.csv(here("open_profiles.csv")) %>% 
  filter(New.Return == "new")
make_cards(new_players, "brown1", "new_players")


#####
intermediate_players = open_players %>% 
  filter(Overall.Skill == "Intermediate")
make_cards(intermediate_players, "darkgoldenrod1", "intermediate_players")


#####
beginner_players = open_players %>% 
  filter(Overall.Skill == "Beginner")
make_cards(beginner_players, "darkolivegreen3", "beginner_players")


#####
returning_players = read.csv(here("open_profiles.csv")) %>% 
  filter(New.Return == "returning")
make_cards(returning_players, "coral", "returning_players")


#####
primary_qbs = qb_list = open_players %>% 
  filter(QB == "Yes") 
make_cards(primary_qbs, "aquamarine", "primary_qbs")

#####
secondary_qbs = open_players %>% 
  filter(QB == "Prefer Back up QB")
make_cards(secondary_qbs, "bisque2", "secondary_qbs")
