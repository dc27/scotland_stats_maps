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
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "",
      notes = ""
    )
  ),
  "Labour Force" = list(
    "Adults with low or no qualifications" = list(
      data = read_csv("data/clean_data/low_no_qualifications.csv",
                      col_types = cols(age = col_factor())),
      explorable_vars = c("year", "gender", "age", "measure_type"),
      explorable_areas = c("local authority"),
      units = "persons",
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fadults-16-64-years-with-low-or-no-qualifications",
      notes = ""
    )
  ),
  "Managament Information" = list(
    
  ),
  "Population" = list(
    "Healthy Life Expectancy" = list(
      data = read_csv("data/clean_data/healthy_life_expectancy.csv"),
      explorable_vars = c("reference_period", "sex"),
      explorable_areas = c("health board", "local authority"),
      units = "years",
      reverse_colours = TRUE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fhealthy-life-expectancy",
      notes = ""
    ),
    "Population Estimates" = list(
      data = read_csv("data/clean_data/population_estimates.csv"),
      explorable_vars = c("year", "sex"),
      explorable_areas = c("health board", "local authority"),
      units = "persons",
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fpopulation-estimates-2011-datazone-linked-dataset",
      notes = ""
    )
  ),
  "Transport" = list(
    
  )
)