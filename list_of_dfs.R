 cleaned_dfs <- list(
  "Access to Services" = list(

  ),
  "Business, Enterprise and Energy" = list(
    "Business Demographics - Births and Deaths" = list(
      data = read_csv("data/clean_data/business_enterprise_and_energy/business_demo_births_deaths.csv"),
      explorable_vars = c("year", "business_demography", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fbusiness-demography---births-and-deaths",
      notes = c("Business births and deaths are produced by the Office for National Statistics within their Business Demography publication. Data are based on registrations and de-registrations for VAT and PAYE. Please note that registrations for 2007 increased substantially on 2006. It is likely that these figures partly reflect the impact of changes in tax rules in April 2007 surrounding Managed Service Companies.",
                "Businesses registered as Managed Service Companies at one address were previously excluded from this series; however following the change to the tax rules a number of these businesses have de-registered and re-registered as single entities elsewhere and this activity has been included in the series.",
                "The population estimates used to form the rates are sourced from the Mid-Year Population Estimates, published by the National Records of Scotland. The term \"per 10,000 adults\" is defined as people aged 16 or over resident in Scotland.")
    ),
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
    "Children and Families with Limited Resources" = list(
      data = read_csv("data/clean_data/sg_children_and_young_people/children_and_families_with_limited_resources.csv"),
      explorable_vars = c("date_code", "housing_costs"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "",
      notes = ""
    )
  ),
  "Community Wellbeing and Social Environment" = list(
    "Derelict and Urban Vacant Land" = list(
      data = read_csv("data/clean_data/community_wellbeing_and_soc_env/derelict_and_urban_vacant_land.csv"),
      explorable_vars = c("year", "area"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fvacant-derelict-land",
      notes = c(
        "Derelict land (and buildings) is land which has been so damaged by development, that it is incapable of development for beneficial use without rehabilitation. In addition the land must currently not be used for the purpose for which it is held or a use acceptable in the local plan. Land also qualifies as derelict if it has an un-remedied previous use which could constrain future development.",
        "Vacant land is land which is unused for the purposes for which it is held and is viewed as an appropriate site for development. This land must either have had prior development on it or preparatory work has taken place in anticipation of future development. This indicator covers vacant land (referred to as 'urban vacant') that is located within settlements of over 2,000 in population as defined in council local plans.",
        "Sites covering less than 0.1 hectare are excluded. The survey is voluntary. If a local authority does not complete the survey the most recent available data is used.")
    )
    
  ),
  "Crime and Justice" = list(
    "Recorded Crimes and Offences" = list(
      data = read_csv("data/clean_data/crime_and_justice/recorded_crimes.csv"),
      explorable_vars = c("date_code", "crime_or_offence", "measure_type"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Frecorded-crime",
      notes = c("Number, and rate per 10,000 population, of crimes and offences recorded by the police. For more information on the recorded crime figures please see the Scottish Government website.",
                "Crimes and offences per 10,000 population rates are calculated as follows: (total number of recorded crimes / mid-year population estimate) x (10,000 / 1). When calculating the rates of crimes and offences per 10,000 population, the relevant mid-year population estimates produced by the National Records of Scotland are used. The mid-year population estimates can be accessed here. The statistical return from which the data are taken is a simple count of the numbers of crimes and offences recorded and cleared up by the police. Returns are submitted quarterly from Police Scotland at local authority level which allows a national total to be obtained. Crimes and offences are included against the year in which they are recorded by the police. This is not necessarily the year in which the crime or offence took place, the year in which the accused is brought to trial for the crime or offence, or the year in which the case is finally disposed of by the courts. Amendments (such as the deletion of incidents found on investigation not to be criminal) which arise after the end of the financial year are not incorporated."
    )),
    "Reconvictions" = list(
      data = read_csv("data/clean_data/crime_and_justice/reconvictions.csv"),
      explorable_vars = c("date_code", "gender", "age", "measure_type"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Freconvictions",
      notes = c("This dataset includes the reconviction rate and the average number of reconvictions per offender for local authorities and at the national level. These are published annually in the Reconviction Rates in Scotland National Statistics Bulletin.",
                "Reconvictions are calculated for a cohort of offenders that have either been released from custody or given a non-custodial sentence in Scottish court in each financial year.",
                "The reconviction rate is the percentage of offenders that were reconvicted in a Scottish court within a year of being released from custody or given a non-custodial sentence.",
                "The average number of reconvictions is a measure of, on average, how many times offenders are reconvicted in a Scottish court within a year of being released from a custodial sentence or given a non-custodial sentence. Note that as these are averages for the cohort, there would be variation within the cohort; as some offenders are not reconvicted, but others may be reconvicted several times.",
                "The figures are based on data held on the Scottish Offenders Index (SOI) which is derived from the Criminal History System at the Scottish Police Authority. The SOI covers all convictions where the main offence was a crime in Groups 1-5 of the Scottish Governments classification of crimes and offences; or some crimes and offences in Group 6, including common assault, breach of the peace, racially aggravated harassment or conduct, miscellaneous firearms offences and social security offences.")
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
      data = read_csv("data/clean_data/health/alcohol_related_discharge.csv",
                      col_types = cols(value = col_integer())),
      explorable_vars = c("ref_period"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Falcohol-related-discharge",
      notes = "obsolete"
    ),
    "Alcohol Related Hospital Statistics" = list(
      data = read_csv("data/clean_data/health/alcohol_related_hospital_stats.csv"),
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
      notes = c("Numbers of new cases for the following types of cancer: malignant neoplasms (excluding non melanoma skin cancer), lung cancer (including cancers of the trachea and bronchus), malignant female breast tumours, colorectal cancers (constituting cancers of the colon, rectum and rectosigmoid junction), and malignant prostate tumours.",
                "Note that some information may have been suppressed or adjusted to preserve patient confidentiality")
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
      notes = c("Number, and percent of, children who have received 1 dose of Measles, Mumps and Rubella (MMR) vaccine by 5 years of age.",
                "The NHS Board and local authority are derived from child's home postcode and therefore data with invalid or missing postcodes are not included in the NHS Board and local authority totals. As a result the numbers and rates often differ from those published in the ISD National Statistics publication which can be accessed from the NHS Information Services Division website.",
                "Source: Scottish Immunisation and Recall System (SIRS), ISD Scotland.")
    )
  ),
  "Housing" = list(
    "Average Household Size" = list(
      data = read_csv("data/clean_data/housing/average_household_size.csv"),
      explorable_vars = c("year"),
      reverse_colours = FALSE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Faverage-household-size",
      notes = c("This dataset contains information on the average number of people per household ('average household size') in each council area and in Scotland. Average household size is calculated using the mid-year household estimates, the mid-year population estimates, and communal establishment rates from Scotland's Census 2001 and 2011.",
                "The first stage is to calculate the number of people living in private households (the 'private household population') rather than in communal establishments, such as student halls of residence, prisons or care homes. This is done by applying the communal establishment rates to the mid-year population estimates to estimate the communal establishment population, and subtracting this population from the mid-year population estimate. Communal establishment rates for 2002 to 2010 are estimated from the rates from Scotland's Census 2001 and 2011. The communal establishment rates from Scotland's Census 2011 are used from 2012 onwards.",
                "The second stage is to estimate average household size by dividing the private household population by the mid-year household estimate.")
    ),
    "Council House Sales" = list(
      data = read_csv("data/clean_data/housing/council_house_sales.csv"),
      explorable_vars = c("year", "dwelling_type"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fcouncil-house-sales",
      notes = c("This dataset presents information on the number of council house sales to sitting tenants by housing type, based on an analysis carried out a number of years ago using Scottish Government Housing Statistics SALES3 returns from 1980 to 2005, in which sales were assigned to different geographical areas based on the address data held for each sale. A range of separate tables presenting Scotland and local authority level sales figures are available on the Housing Statistics for Scotland website as Excel downloads, and these contain more up-to-date figures at these geographical levels, as well as presenting further details of some component parts such as whether the sales have been under modernised or old terms.",
                "The Scottish Government Housing Statistics SALES3 case based return collects information on sales to sitting tenants only. This includes right to buy sales, rent to mortgage sales and voluntary sales. To create a consistent time series of right to buy sales and compare trends across Scotland, sales figures in local authorities that have transferred their housing stock to housing associations are included in the figures.")
    ),
    "HMO Licences" = list(
      data = read_csv("data/clean_data/housing/hmo_licences.csv"),
      explorable_vars = c("year"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fhmo-licences",
      notes = c("Numbers of properties with an HMO licence in force at 31st of March. The mandatory licensing scheme for houses in multiple occupation came into force on 1 October 2001. Information on the scheme can be found on the Scottish Government's website. More information on types of HMO licences in operation and on applications for licensing is also available.")
    )
  ),
  "Labour Force" = list(
    "Adults with low or no qualifications" = list(
      data = read_csv("data/clean_data/labour_force/low_no_qualifications.csv",
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
      data = read_csv("data/clean_data/population/healthy_life_expectancy.csv"),
      explorable_vars = c("reference_period", "sex"),
      reverse_colours = TRUE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fhealthy-life-expectancy",
      notes = ""
    ),
    "Population Estimates" = list(
      data = read_csv("data/clean_data/population/population_estimates.csv"),
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
      notes = c("Number of people killed and seriously injured on Scotland's roads. These figures are from the STATS-19 statistical returns collected from the police forces across Scotland. These statistics only focus on those accidents involving killed and seriously injured casualties. From around June/July 2019 Police Scotland has been using a new accident and casualty data recording system called CRASH (Collision Reporting and Sharing). As this is an injury-based reporting system it tends to result in more casualties being classified as \"serious\" and therefore causes a discontinuity in the time series. Please do not try to compare serious casualties from 2019 onwards with previous years.",
                "The statistics were compiled from returns made by police forces, which cover all accidents in which a vehicle is involved that occur on roads (including footways) and result in personal injury, if they become known to the police. The vehicle need not be moving, and need not be in collision - for example, the returns include accidents involving people alighting from buses."
      )
    ),
    "Road Transport Expenditure" = list(
      data = read_csv("data/clean_data/transport/road_transport_expenditure.csv"),
      explorable_vars = c("year"),
      reverse_colours = FALSE,
      by_pop = TRUE,
      url = "https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Froad-transport-expenditure",
      notes = c("These figures are the net revenue expenditure on roads and transport (excluding loan charges) by area.",
                "It should be noted that the negative figure of £9,058 thousand pounds for Edinburgh council spending on transport in 2018 is mainly due to receipts from car parking charges."
      )
    ),
    "Travel to Work and Other Purposes" = list(
      data = read_csv("data/clean_data/transport/travel_to_work.csv"),
      explorable_vars = c("year", "indicator"),
      reverse_colours = TRUE,
      by_pop = FALSE,
      url = "https://statistics.gov.scot/slice?dataset=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Ftravel-to-work-other",
      notes = "These estimates are from the Scottish Household Survey Travel Diary, which asks adult respondents about all the journeys which they made the previous day, as well as information about the mode, purpose, duration and length of these journeys. The SHS has an annual sample size of around 10,000 individuals and, since 2012, has operated with a fully unclustered sample design."
    )
  )
)
