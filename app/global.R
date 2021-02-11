library(shiny)
library(shinydashboard)


hle_data <- read_csv("../data/clean_data/healthy_life_expectancy.csv")

hle_reference_periods <- sort(unique(hle_data$reference_period))
sexes <- unique(hle_data$sex)