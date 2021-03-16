 cleaned_dfs <- list(
  "Access to Services" = list(
    
  ),
  "Business, Enterprise and Energy" = list(
    "Energy Consumption" = list(
      data = read_csv("data/clean_data/business_enterprise_and_energy/energy_consumption.csv"),
      explorable_vars = c("year", "sector", "energy_type"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fenergy-consumption",
      notes = "This dataset combines three individual datasets published by the Department for Business, Energy and Industrial Strategy (BEIS) of the UK Government. The datasets are Sub-National Total final Energy Consumption, Sub-National Electricity Consumption and Sub-National Gas Consumption."
    )
  ),
  "Children and Young People" = list(
    
  ),
  "Community Wellbeing and Social Environment" = list(
    
  ),
  "Crime and Justice" = list(
    "Recorded Crimes and Offences" = list(
      data = read_csv("data/clean_data/crime_and_justice/recorded_crimes.csv"),
      explorable_vars = c("date_code", "crime_or_offence", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Frecorded-crime",
      notes = "Number, and rate per 10,000 population, of crimes and offences recorded by the police. For more information on the recorded crime figures please see the Scottish Government website.

Crimes and offences per 10,000 population rates are calculated as follows: (total number of recorded crimes / mid-year population estimate) x (10,000 / 1). When calculating the rates of crimes and offences per 10,000 population, the relevant mid-year population estimates produced by the National Records of Scotland are used. The mid-year population estimates can be accessed here. The statistical return from which the data are taken is a simple count of the numbers of crimes and offences recorded and cleared up by the police. Returns are submitted quarterly from Police Scotland at local authority level which allows a national total to be obtained. Crimes and offences are included against the year in which they are recorded by the police. This is not necessarily the year in which the crime or offence took place, the year in which the accused is brought to trial for the crime or offence, or the year in which the case is finally disposed of by the courts. Amendments (such as the deletion of incidents found on investigation not to be criminal) which arise after the end of the financial year are not incorporated."
    )
  ),
  "Economic Activity, Benefits and Tax Credits" = list(
    "Earnings" = list(
      data = read_csv("data/clean_data/economic_activity/earnings.csv"),
      explorable_vars = c("year", "gender", "working_pattern",
                          "population_group", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fearnings",
      notes = "The median and mean gross weekly earnings (before deductions for Tax & National Insurance) of full-time employees on adult rates, whose pay for the survey period was not affected by absence. The self-employed are excluded from this study. This information is obtained from the Annual Survey of Hours & Earnings (ASHE). This is an Office for National Statistics (ONS) publication"
    )
  ),
  "Economy" = list(
    
  ),
  "Education, Skills and Training" = list(
    
  ),
  "Environment" = list(
    "Municipal Waste" = list(
      data = read_csv("data/clean_data/environment/municipal_waste.csv"),
      explorable_vars = c("reference_period", "indicator"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fmunicipal-waste",
      notes = "Municipal solid waste includes household waste and similar waste from businesses. Local Authority Collected Municipal Solid Waste (LACMSW) is the municipal solid waste collected by, or on behalf of, local authorities. It excludes: abandoned vehicles, road maintenance waste, commercial waste that is delivered to local authority owned or run landfill sites but where the local authority has no part in the collection or disposal arrangements that have led to this delivery, industrial waste collected from industrial premises and taken for disposal or treatment separately from any other waste, and construction and demolition waste that is collected and taken for disposal or treatment separately from any other waste."
    )
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
    "General Practice List Size" = list(
      data = read_csv("data/clean_data/health/gp_list_sizes.csv"),
      explorable_vars = c("year"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fgeneral-practice-list-size",
      notes = "Data indicates patients registered with practices by Health Board and Local Authority as at 1 October for each year presented. Since the introduction of the new GP contract (the General Medical Services contract) on 1 April 2004, patients register with a practice rather than a specific GP. "
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
    "Road Transport Expenditure" = list(
      data = read_csv("data/clean_data/transport/road_transport_expenditure.csv"),
      explorable_vars = c("year"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Froad-transport-expenditure",
      notes = "These figures are the net revenue expenditure on roads and transport (excluding loan charges) by area.

It should be noted that the negative figure of £9,058 thousand pounds for Edinburgh council spending on transport in 2018 is mainly due to receipts from car parking charges."
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