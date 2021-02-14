# ----- Healthy Life Expectancy ------

# read in data for male and female HLE from separate files
male_hle_data <- read_csv("data/raw_data/male-healthy-life-expectancy.csv",
                          skip = 10)
female_hle_data <- read_csv("data/raw_data/female-healthy-life-expectancy.csv",
                            skip = 10)

# convert reference periods to long format, apply same pivot to both dfs
pivot_hle_long <- function(hle_df, df_sex) {
  long_df <- hle_df %>% 
    pivot_longer(-c(1,2), names_to = "ref_period",
                 values_to = "measurement") %>% 
    janitor::clean_names() %>% 
    mutate(area_code = str_extract(
      http_purl_org_linked_data_sdmx_2009_dimension_number_ref_area,
      "S[0-9]+$")) %>% 
    select(-1) %>% 
    # filter for only Health Boards at this time
    filter(!str_detect(area_code, "^S9")) %>% 
    # add sex reference column
    mutate(sex = df_sex)
}

tidy_male_hle <- pivot_hle_long(male_hle_data, "male")
tidy_female_hle <- pivot_hle_long(female_hle_data, "female")

# combine dfs
hle_data <- tidy_male_hle %>% 
  bind_rows(tidy_female_hle)

hle_data <- hle_data %>% 
  mutate(area_type = case_when(
    str_detect(area_code, "^S12+") ~ "local authority",
    str_detect(area_code, "^S08+") ~ "health board"))

# generate standard output column form
hle_data <- hle_data %>% 
  select(area_code,
         reference_area,
         area_type,
         reference_period = ref_period,
         sex,
         measurement
         )

# write data to clean csv
hle_data %>% 
  write_csv("data/clean_data/healthy_life_expectancy.csv")