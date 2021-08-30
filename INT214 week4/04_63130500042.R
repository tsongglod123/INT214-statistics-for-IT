library(dplyr)

glimpse(starwars)

starwars$height %>% mean(na.rm = T)

starwars %>% select(name, height) %>% head()

#Excluding
starwars %>% select(-hair_color,-skin_color,-eye_color) %>% head()

starwars %>% filter(sex == "male")
starwars %>% filter(!(sex == "male")) 
starwars %>% filter(sex == "male" | skin_color == "light") # or
starwars %>% filter(sex == "male", skin_color == "light") # and

starwars %>% select(name, height, mass, skin_color) %>% 
    filter(skin_color == "light")

starwars %>% group_by(sex) %>% select(sex, height) %>%
    summarise(avg_height = mean(height, na.rm = T))
