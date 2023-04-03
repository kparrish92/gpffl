library(here)
library(tidyverse)

open_players = read.csv(here("open_profiles.csv"), na.strings=c("","NA")) %>% 
  filter(!is.na(First.Name))


make_playercard_primary = function(First.Name, Last.Name, 
                           Previous.Flag.Positions, 
                           Dates.Missing, open_players_new,
                           Overall.Skill,
                           Height, Shirt.Size,
                           Pronouns, Current.sports,
                           HS.Coll.Sports)
{
  plot = ggplot(mtcars, aes(wt, mpg)) + 
    annotate("text", x = 4, y = 25, 
             label = paste("Position:",
                           str_wrap(Previous.Flag.Positions, width = 50))) +
    annotate("text", x = 4, y = 24, 
             label = paste("Missing dates:",
                           str_wrap(Dates.Missing, width = 50))) +
    annotate("text", x = 4, y = 22, 
             label = paste("HS sports:", 
                           str_wrap(Current.sports, width = 50))) +
    annotate("text", x = 4, y = 23, 
             label = paste("Current sports:", 
                           str_wrap(HS.Coll.Sports, width = 50))) +
    theme_minimal() + labs(title = paste(First.Name, Last.Name),
                           subtitle = paste(Overall.Skill,
                                            "-",
                                            Height,
                                            "-",
                                            Shirt.Size)) +
    ylim(20,30) +
    theme(panel.grid.major.x = element_blank()) +
    theme(panel.grid.major.y = element_blank()) +
    scale_x_continuous(breaks = NULL) +
    scale_y_continuous(breaks = NULL) + xlab("") + ylab("") +
    labs(caption = paste(Pronouns)) +
    theme(panel.background = element_rect(fill = "aquamarine3",
                                          colour = "lightblue",
                                          size = 0.5, linetype = "solid"))
  return(plot)
}

df = open_players

for (i in 1:nrow(df)){
 plot = make_playercard(First.Name = df$First.Name[i],
                  Last.Name = df$Last.Name[i],
                  Previous.Flag.Positions = df$Previous.Flag.Positions[i],
                  Dates.Missing = df$Dates.Missing[i],
                  open_players_new = df$open_players_new[i],
                  Overall.Skill = df$Overall.Skill[i],
                  Height = df$Height[i],
                  Shirt.Size = df$Shirt.Size[i],
                  Pronouns = df$Pronouns[i],
                  Current.sports = df$Current.sports[i],
                  HS.Coll.Sports = df$HS.Coll.Sports[i])
 
ggsave(path = here("plots"),
       device = "png", filename = paste0(df$Last.Name[i], "_pc.png" ), plot = plot)
}
  