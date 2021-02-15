make_dropdown <- function(df, var) {
  varname <- str_to_title(str_replace(var, "_", " "))
  selectInput(var, varname, sort(unique(df[[var]])))
}

# filter_df takes a list of terms to filter a df by, terms in the list must
# correspond to vars and values in the df.
filter_df <- function(df, vars, user_in) {
  filtered_df <- df
  
  for (var in vars) {
    var = as.name(var)

    filtered_df <- filtered_df %>% 
      filter(!!var == user_in)
  }
  return(filtered_df)
}

filter_var <- function(x, val) {
    x %in% val
}

# combine measurements with polygon data
join_with_shapes <- function(measurement_df, spdf) {
  spdf@data <- spdf@data %>%
    left_join(measurement_df, by = c("id_code" = "area_code"))
  
  return(spdf)
}