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
    "Alcohol Related Discharge" = list(
      data = read_csv("data/clean_data/alcohol_related_discharge.csv",
                      col_types = cols(value = col_integer())),
      explorable_vars = c("ref_period"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Falcohol-related-discharge",
      notes = "obsolete"
    ),
    "Alcohol Related Hospital Statistics" = list(
      data = read_csv("data/clean_data/alcohol_related_hospital_stats.csv"),
      explorable_vars = c("reference_period", "alcohol_condition", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Falcohol-related-hospital-statistics",
      notes = ""
    )
  ),
  "Housing" = list(
    "Council House Sales" = list(
      data = read_csv("data/clean_data/council_house_sales.csv"),
      explorable_vars = c("year", "dwelling_type"),
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
      units = "persons",
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fadults-16-64-years-with-low-or-no-qualifications",
      notes = "The ratio is the number of people who reported having low or no qualification divided by the number of people in employment (16-64 years). A small number with unknown qualifications are excluded from this calculation."
    )
  ),
  "Managament Information" = list(
    
  ),
  "Population" = list(
    "Healthy Life Expectancy" = list(
      data = read_csv("data/clean_data/healthy_life_expectancy.csv"),
      explorable_vars = c("reference_period", "sex"),
      reverse_colours = TRUE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fhealthy-life-expectancy",
      notes = ""
    ),
    "Population Estimates" = list(
      data = read_csv("data/clean_data/population_estimates.csv"),
      explorable_vars = c("year", "sex"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fpopulation-estimates-2011-datazone-linked-dataset",
      notes = ""
    )
  ),
  "Transport" = list(
    "Travel to Work and Other Purposes" = list(
      data = read_csv("data/clean_data/travel_to_work.csv"),
      explorable_vars = c("year", "indicator"),
      reverse_colours = TRUE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/slice?dataset=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Ftravel-to-work-other",
      notes = "These estimates are from the Scottish Household Survey Travel Diary, which asks adult respondents about all the journeys which they made the previous day, as well as information about the mode, purpose, duration and length of these journeys. The SHS has an annual sample size of around 10,000 individuals and, since 2012, has operated with a fully unclustered sample design."
    )
    
  )
)