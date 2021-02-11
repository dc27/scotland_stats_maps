server <- function(input, output){
  

  create_hb_map <- function(measurement_df, sex, spdf) {
    # measurement_df is calculated in the server - determined by user inputs
    # bind to shape data
    spdf@data <- spdf@data %>%
      left_join(measurement_df, by = c("reference_area" = "reference_area"))
    
    
    # pretty labels
    labels <- sprintf("<strong>%s</strong><br/>%g years",
                      spdf$reference_area, spdf$measurement) %>%
      lapply(htmltools::HTML)
    
    # plot
    leaflet(options = leafletOptions(minZoom = 6)) %>%
      setView(lng = -5, lat = 57.35, zoom = 6) %>%
      # restrict view to around Scotland
      setMaxBounds(lng1 = -1,
                   lat1 = 50,
                   lng2 = -9,
                   lat2 = 64) %>% 
      # load in basemap
      addProviderTiles(providers$CartoDB.PositronNoLabels) %>% 
      # add Health Board polygons, colour based on LE, highlight on hover
      addPolygons(data = spdf, color = "white",
                  fillColor = ~colorQuantile(
                    "YlOrRd", (-spdf$measurement))
                  (-hb_shapes$measurement),
                  weight = 1, fillOpacity = 0.9, label = labels,
                  highlightOptions = highlightOptions(
                    color = "white", weight = 2,
                    opacity = 0.9, bringToFront = TRUE))
  }
    output$scotland_map <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 6)) %>%
        setView(lng = -5, lat = 57.35, zoom = 6) %>%
        # restrict view to around Scotland
        setMaxBounds(lng1 = -1,
                     lat1 = 50,
                     lng2 = -9,
                     lat2 = 64) %>% 
        addProviderTiles(providers$CartoDB.PositronNoLabels)
    })
}