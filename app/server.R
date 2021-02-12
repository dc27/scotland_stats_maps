source("R/filter_and_join_df_functions.R")
source("R/plot_functions.R")

server <- function(input, output, session){
  
  hle_user_selections <- reactive(list(
      reference_period = input$date_range,
      sex = input$sex
    )
  )
  
  filtered_hle_df <- reactive(filter_df(hle_data, hle_user_selections()))
  
  # render basemap
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
  
  # plot polygons
  observe({
    add_coloured_polygons(
      basemap = "scotland_map", spdf = spdf(),
      colour_scheme = input$colour_choice,
      units = "years"
    )
  })
  
  # plot legend
  observe({
    leafletProxy("scotland_map") %>% 
      clearControls()
    
    if (input$legend) {
      add_legend(
        "scotland_map", spdf = spdf(), colour_scheme = input$colour_choice,
        title = "Healthy L.E."
      )}
  })
}