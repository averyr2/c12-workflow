# Reads in and writes out data about evictions in South Carolina based on city boundaries

# Data source: "https://data-downloads.evictionlab.org"

# By Avery Rogers
# Version: 1-29-2020


library(tidyverse)
library(ussf)

#Parameters
#Input file
file_raw <- here::here("data-raw/cities.geojson")

file_out <- here::here("data/sc_city_boundaries.rds")

vars <- c("GEOID", "n", "geometry")

#=============================================================================

file_raw %>%
  sf::read_sf() %>%
  select(vars) %>%
  transmute(
    GEOID = as.integer(GEOID),
    name = as.character(n),
    geometry
  ) %>%
  write_rds(file_out)
