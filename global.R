library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)
library(stringr)
library(purrr)
library(rgdal)
library(leaflet)

source("list_of_dfs.R")

# dataframes
dfs <- rlist::list.clean(cleaned_dfs, fun = function(x) length(x) == 0L)


# colour options
colour_pals <- RColorBrewer::brewer.pal.info %>%
  filter(category == "seq") %>% 
  rownames()

# shapefiles

# health boards
hb_shapes <- readOGR(
  dsn = "data/simplified_shapefiles/NHS_HealthBoards_2019",
  layer = "NHS_HealthBoards_2019",
  GDAL1_integer64_policy = TRUE)

# local authorities

la_shapes <- readOGR(
  dsn = "data/simplified_shapefiles/scottish_local_authorities",
  layer = "scottish_local_authorities",
  GDAL1_integer64_policy = TRUE
)