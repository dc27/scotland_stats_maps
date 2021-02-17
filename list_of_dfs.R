 cleaned_dfs <- list(
  "Access to Services" = list(
    
  ),
  "Business, Enterprise and Energy" = list(
    
  ),
  "Children and Young People" = list(
    
  ),
  "Community Wellbeing and Social Environment" = list(
    
  ),
  "Crime and Justice" = list(
    
  ),
  "Economic Activity, Benefits and Tax Credits" = list(
    
  ),
  "Economy" = list(
    
  ),
  "Education, Skills and Training" = list(
    
  ),
  "Environment" = list(
    
  ),
  "Geography" = list(
    
  ),
  "Health and Social Care" = list(
    
  ),
  "Housing" = list(
    "Council House Sales" = list(
      data = read_csv("data/clean_data/council_house_sales.csv"),
      explorable_vars = c("year", "dwelling_type"),
      explorable_areas = c("health board", "local authority"),
      units = "dwellings",
      by_pop = TRUE,
      url = "",
      notes = ""
    )
  ),
  "Labour Force" = list(
    
  ),
  "Managament Information" = list(
    
  ),
  "Population" = list(
    "Healthy Life Expectancy" = list(
      data = read_csv("data/clean_data/healthy_life_expectancy.csv"),
      explorable_vars = c("reference_period", "sex"),
      explorable_areas = c("health board", "local authority"),
      units = "years",
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fhealthy-life-expectancy",
      notes = ""
    ),
    "Population Estimates" = list(
      data = read_csv("data/clean_data/population_estimates.csv"),
      explorable_vars = c("year", "sex"),
      eplorable_areas = c("health board", "local authority"),
      units = "persons",
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fpopulation-estimates-2011-datazone-linked-dataset",
      notes = ""
    )
  ),
  "Transport" = list(
    
  )
)