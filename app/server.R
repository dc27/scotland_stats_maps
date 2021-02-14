source("R/filter_and_join_df_functions.R")
source("R/plot_functions.R")

server <- function(input, output, session){
  
  hle_user_selections <- eventReactive(input$update, list(
      reference_period = input$date_range,
      sex = input$sex,
      area_type = input$area_type
    )
  )
  
  filtered_hle_df <- eventReactive(input$update,
                                   filter_df(hle_data, hle_user_selections()))
  
  # render basemap
  output$scotland_map <- renderLeaflet({
    leaflet(options = leafletOptions(minZoom = 6)) %>%
      setView(lng = -5, lat = 58, zoom = 7) %>%
      # restrict view to around Scotland
      setMaxBounds(lng1 = -1,
                   lat1 = 54,
                   lng2 = -9,
                   lat2 = 63) %>% 
      addProviderTiles(providers$CartoDB.PositronNoLabels)
  })
  
  plot_spdf <- eventReactive(input$update, {
    if (input$area_type == "health board") {
      spdf <- join_with_shapes(filtered_hle_df(), hb_shapes)
    } else if (input$area_type == "local authority") {
      spdf <- join_with_shapes(filtered_hle_df(), la_shapes)
    }
  })
  
  # plot polygons
  observe({
    add_coloured_polygons(
      basemap = "scotland_map", spdf = plot_spdf(),
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
        "scotland_map", spdf = plot_spdf(), colour_scheme = input$colour_choice,
        title = "Healthy L.E."
      )}
  })
}