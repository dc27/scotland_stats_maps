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
    ),
    "Cancer Registrations - Annual Data" = list(
      data = read_csv("data/clean_data/health/cancer_regs_annual.csv"),
      explorable_vars = c("year", "gender", "cancer_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fcancer-registrations---annual-data",
      notes = "Numbers of new cases for the following types of cancer: malignant neoplasms (excluding non melanoma skin cancer), lung cancer (including cancers of the trachea and bronchus), malignant female breast tumours, colorectal cancers (constituting cancers of the colon, rectum and rectosigmoid junction), and malignant prostate tumours.

Note that some information may have been suppressed or adjusted to preserve patient confidentiality"
    ),
    "Measles Mumps Rubella (MMR) Immunisation" = list(
      data = read_csv("data/clean_data/health/mmr.csv"),
      explorable_vars = c("year", "vaccination_uptake", "measure_type"),
      reverse_colours = TRUE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fmeasles-mumps-rubella",
      notes = "Number, and percent of, children who have received 1 dose of
      Measles, Mumps and Rubella (MMR) vaccine by 5 years of age. 
      \n\n The NHS Board and local authority are derived from child's home
      postcode and therefore data with invalid or missing postcodes are not
      included in the NHS Board and local authority totals. As a result the
      numbers and rates often differ from those published in the ISD National
      Statistics publication which can be accessed from the NHS Information
      Services Division website. \n\n Source: Scottish Immunisation and Recall
      System (SIRS), ISD Scotland."
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
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fadults-16-64-years-with-low-or-no-qualifications",
      notes = "The ratio is the number of people who reported having low or no qualification divided by the number of people in employment (16-64 years). A small number with unknown qualifications are excluded from this calculation."
    ),
    "Gender Pay Gap" = list(
      data = read_csv("data/clean_data/labour_force/gender_pay_gap.csv"),
      explorable_vars = c("year", "working_pattern"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fearnings-paygap",
      notes = "This indicator measures the difference between male and female median earnings ( gross hourly earnings excluding overtime), expressed as a percentage of male earnings. Estimates are workplace based and cover employees on adult rates whose pay for the survey pay-period was not affected by absence."
    ),
    "Not in Employment, Education, or Training" = list(
      data = read_csv("data/clean_data/labour_force/neet.csv"),
      explorable_vars = c("year", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fneet",
      notes = "The official measure of those aged 16-19 not in employment, education or training, otherwise known as the More Choices, More Chances (MCMC) group, is taken from the Annual Population Survey (APS)."
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
    "Road Casualties" = list(
      data = read_csv("data/clean_data/transport/road_casualties.csv"),
      explorable_vars = c("year", "age", "gender", "outcome", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Froad-safety",
      notes = "Number of people killed and seriously injured on Scotland's roads. These figures are from the STATS-19 statistical returns collected from the police forces across Scotland. These statistics only focus on those accidents involving killed and seriously injured casualties. From around June/July 2019 Police Scotland has been using a new accident and casualty data recording system called CRASH (Collision Reporting and Sharing). As this is an injury-based reporting system it tends to result in more casualties being classified as \"serious\" and therefore causes a discontinuity in the time series. Please do not try to compare serious casualties from 2019 onwards with previous years.

The statistics were compiled from returns made by police forces, which cover all accidents in which a vehicle is involved that occur on roads (including footways) and result in personal injury, if they become known to the police. The vehicle need not be moving, and need not be in collision - for example, the returns include accidents involving people alighting from buses."
    ),
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