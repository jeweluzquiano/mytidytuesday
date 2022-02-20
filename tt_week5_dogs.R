library(tidytuesdayR)
library(tidyverse)

## load in the data
breed_traits <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/breed_traits.csv') %>% 
  janitor::clean_names()
trait_description <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/trait_description.csv') %>% 
  janitor::clean_names()
breed_rank_all <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/breed_rank.csv') %>% 
  janitor::clean_names()

## join the data
unique(breed_rank_all$Breed)
unique(breed_traits$Breed)

## find rows in ranking dataset where breeds have NA rank
missing_rank <- subset(breed_rank_all, is.na(breed_rank_all$x2013_rank))


breed_traits_rank <- left_join(breed_traits, breed_rank_all)

unique(breed_traits_rank$Breed)
x <- breed_traits_rank[1,]
