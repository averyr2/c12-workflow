# Combines cities and city boundaries data into one rds file

# Data source: "https://data-downloads.evictionlab.org"

# By Avery Rogers
# Version: 1-29-2020


library(tidyverse)

#Parameters

  #City data file
file_cities <- here::here("data/sc_cities.rds")

  # City boundary data file
file_city_boundaries <- here::here("data/sc_city_boundaries.rds")

  #Output file
file_out <- here::here("data/sc_cities_boundaries.rds")

# ============================================================

cities <-
  file_cities %>%
  read_rds()

city_boundaries <-
  file_city_boundaries %>%
  read_rds() %>%
  left_join(cities, by = "GEOID") %>%
  write_rds(file_out)

