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
  # measurement_df is calculated in the server - determined by user inputs
  # bind to shape data
  spdf@data <- spdf@data %>%
    left_join(measurement_df, by = c("area_name" = "reference_area"))
  
  return(spdf)
}

add_coloured_polygons <- function(basemap, spdf, colour_scheme = "YlOrRd",
                                  units = "") {
  # pretty labels
  labels <- sprintf(paste0("<strong>%s</strong><br/>%g",units),
                    spdf$area_name, spdf$measurement) %>%
    lapply(htmltools::HTML)
  
  # add polygons highlight on hover
  leafletProxy(basemap) %>%
    clearShapes() %>%
    addPolygons(data = spdf, color = "white",
                fillColor = ~colorNumeric(
                  colour_scheme, (-spdf$measurement))
                (-spdf$measurement),
                weight = 1, fillOpacity = 0.8, label = labels,
                highlightOptions = highlightOptions(
                  color = "black", weight = 2,
                  opacity = 0.9, bringToFront = TRUE))
}

add_legend <- function(basemap, spdf, colour_scheme = "YlOrRd",
                       units = "") {
  leafletProxy(basemap) %>% 
    clearControls()
    addLegend(pal = colorNumeric(
      "", (-spdf()$measurement)),
      values = -spdf()$measurement, opacity = 0.6,
      title = "Healthy Life Expectancy",
      position = "bottomright")
}