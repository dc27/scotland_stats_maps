# filter_df takes a list of terms to filter a df by, terms in the list must
# correspond to vars and values in the df.
filter_df <- function(df, filtration_list) {
  filtered_df <- df
  
  for (i in 1:length(filtration_list)) {
    var = names(filtration_list[i])
    var = as.name(var)
    
    user_selection = filtration_list[[i]]
    
    filtered_df <- filtered_df %>% 
      filter(!!var == user_selection)
  }
  
  return(filtered_df)
}

# combine measurements with polygon data
join_with_shapes <- function(measurement_df, spdf) {
  spdf@data <- spdf@data %>%
    left_join(measurement_df, by = c("id_code" = "area_code"))
  
  return(spdf)
}