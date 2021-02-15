library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)
library(purrr)
library(rgdal)
library(leaflet)

# dataframes

dfs <- list(
  "Healthy Life Expectancy" = list(
    data = read_csv("../data/clean_data/healthy_life_expectancy.csv"),
    explorable_vars = c("reference_period", "sex"),
    explorable_areas = c("health board", "local authority"),
    units = "years"
  ),
  "Council House Sales" = list(
    data = read_csv("../data/clean_data/council_house_sales.csv"),
    explorable_vars = c("year", "dwelling_type"),
    explorable_areas = c("health board", "local authority"),
    units = "dwellings"
  )
)

# colour options
colour_pals <- RColorBrewer::brewer.pal.info %>%
  filter(category == "seq") %>% 
  rownames()

# shapefiles

# health boards
hb_shapes <- readOGR(
  dsn = "../data/simplified_shapefiles/NHS_HealthBoards_2019",
  layer = "NHS_HealthBoards_2019",
  GDAL1_integer64_policy = TRUE)

# local authorities

la_shapes <- readOGR(
  dsn = "../data/simplified_shapefiles/scottish_local_authorities",
  layer = "scottish_local_authorities",
  GDAL1_integer64_policy = TRUE
)