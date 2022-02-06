# install.packages("tidytuesdayR")
library(tidytuesdayR)
library(tidyverse)
tt_data <- tt_load(2022, week=4)
ratings <- tt_data$ratings
details <- tt_data$details
View(ratings)
overview <- full_join(details, ratings, by = "id")
