library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)
library(rgdal)
library(leaflet)

# dataframes
hle_data <- list(
  data = read_csv("../data/clean_data/healthy_life_expectancy.csv"),
  explorable_vars = c("reference_period", "sex"),
  explorable_areas = c("health board", "local authority")
)

council_house_data <- list(
  data = read_csv("../data/clean_data/council_house_sales.csv"),
  explorable_vars = c("year", "dwelling_type"),
  explorable_areas = c("health board", "local authority")
)

datasets <- c("Healthy Life Expectancy",
              "Council House Sales")

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