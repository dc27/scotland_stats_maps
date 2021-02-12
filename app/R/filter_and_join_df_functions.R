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

# plot_coloured_polygons updates existing map with coloured polygons -
# chloropeth. Colours based on values given by measurement_df
# (filtered in server). Polygons provided in large SPDF format.
join_with_shapes <- function(measurement_df, spdf) {
  spdf@data <- spdf@data %>%
    left_join(measurement_df, by = c("area_name" = "reference_area"))
  
  return(spdf)
}