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

## filter out rows in ranking dataset where breeds have NA rank
missing_rank <- subset(breed_rank_all, is.na(breed_rank_all$x2013_rank))
nonmissing_rank <- subset(breed_rank_all, !is.na(breed_rank_all$x2013_rank))


## join the data
##sub out ()
breed_rank_all$breed <- gsub(" ", "", breed_rank_all$breed)
breed_rank_all$breed<- gsub("[()]","_", breed_rank_all$breed)

breed_traits$breed <- gsub(" ", "", breed_traits$breed)
breed_traits$breed <- gsub("[ ()]", "_", breed_traits$breed)

breed_traits_rank<- left_join(breed_traits, breed_rank_all, by = "breed_nosp")

# fruits <- c("one (apple", "two pears", "three bananas")
# str_remove(fruits, "[aeiou]")

## looks like join is not working due to spaces or () in column, lets get rid of them
## and see what that does

## looking at breed ranks
!is.na
