library(shiny)
library(shinydashboard)
library(readr)
library(dplyr)
library(stringr)
library(purrr)
library(rgdal)
library(leaflet)
library(assertthat)


source("list_of_dfs.R")

# dataframes
# only take lists with terms in sublist.
dfs <- rlist::list.clean(cleaned_dfs, fun = function(x) length(x) == 0L)

for (category in dfs) {
  for(df in category) {
    # only run if all fields not null
    assert_that(!is.null(df$data))
    assert_that(!is.null(df$explorable_vars))
    assert_that(!is.null(df$explorable_areas))
    assert_that(!is.null(df$units))
    assert_that(!is.null(df$by_pop))
    assert_that(!is.null(df$url))
    assert_that(!is.null(df$notes))
    # only run if explorable vars are in data; area codes are in data,
    # measurement should be called value.
    assert_that(all(c(df$explorable_vars, "area_code",
                  "area_type", "value") %in% names(df$data)))
    # area type must be local authority or health board
    assert_that(any(c("health board", "local authority") %in% unique(df$data$area_type)))
  }
}


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