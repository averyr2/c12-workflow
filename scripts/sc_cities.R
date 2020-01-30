# Reads in and writes out data about evictions in South Carolina at the city level

# Data source: "https://data-downloads.evictionlab.org"

# By Avery Rogers
# Version: 1-29-2020


library(tidyverse)

#Parameters
  #Input file
file_raw <- here::here("data-raw/cities.csv")

file_out <- here::here("data/sc_cities.rds")

vars_types <-
  c(
    GEOID = col_integer(),
    year = col_integer(),
    name = col_character(),
    evictions = col_double()
  )


#=============================================================================

file_raw %>%
  read_csv(col_types = vars_types) %>%
  select(GEOID, year, name, evictions) %>%
  filter(year == 2016) %>%
  write_rds(file_out)
