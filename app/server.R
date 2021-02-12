source("R/filter_df.R")

server <- function(input, output, session){
  
  hle_user_selections <- reactive(list(
      reference_period = input$date_range,
      sex = input$sex
    )
  )

  filtered_hle_df <- reactive(filter_df(hle_data, hle_user_selections()))
  
  output$scotland_map <- renderLeaflet({
    leaflet(options = leafletOptions(minZoom = 6)) %>%
      setView(lng = -5, lat = 58, zoom = 6) %>%
      # restrict view to around Scotland
      setMaxBounds(lng1 = -1,
                   lat1 = 54,
                   lng2 = -9,
                   lat2 = 63) %>% 
      addProviderTiles(providers$CartoDB.PositronNoLabels)
  })
  
  spdf <- reactive(join_with_shapes(filtered_hle_df(), hb_shapes))
  

  observe({
    add_coloured_polygons(
      basemap = "scotland_map", spdf = spdf(),
      colour_scheme = input$colour_choice,
      units = "years"
    )
  })
  
  # plot legend
  observe({
    proxy <- leafletProxy("scotland_map", data = spdf)
    
    # Remove any existing legend, and only if the legend is
    # enabled, create a new one.
    proxy %>% clearControls()
    if (input$legend) {
      proxy %>%

    }
  })
}