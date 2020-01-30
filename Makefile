# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = sc_cities.rds sc_city_boundaries.rds sc_cities_boundaries.rds

# EDA studies
EDA = sc_cities.Rmd

# Reports
REPORTS = sc_cities.md

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
sc_cities.rds : cities.csv
cs_city_boundaries.rds : cities.geojson
sc_cities_boundaries.rds : sc_cities.rds sc_city_boundaries.rds


# EDA study and report dependencies
sc_cities.rds : cities.csv
cs_city_boundaries.rds : cities.geojson
sc_cities_boundaries.rds : sc_cities.rds sc_city_boundaries.rds
sc_cities.md : sc_cities.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
