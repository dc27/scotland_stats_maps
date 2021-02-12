library(shiny)
library(shinydashboard)

# dataframes
hle_data <- read_csv("../data/clean_data/healthy_life_expectancy.csv")

# selectable vars
hle_reference_periods <- sort(unique(hle_data$reference_period))
sexes <- unique(hle_data$sex)


# shapefiles

hb_shapes <- readOGR(
  dsn ="../data/simplified_shapefiles/health_boards/NHS_HealthBoards_2019/",
  layer = "NHS_HealthBoards_2019",
  GDAL1_integer64_policy = TRUE)