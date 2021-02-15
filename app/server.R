source("R/filter_and_join_df_functions.R")
source("R/plot_functions.R")

server <- function(input, output, session){
  # dynamic ui
  dataset <- reactive(dfs[[input$dataset]]$data)
  vars <- reactive(dfs[[input$dataset]]$explorable_vars)

  output$dropdowns <- renderUI(
    map(vars(), ~ make_dropdown(dataset(), .x))
  )
  
  # user inputs for dynamic vars
  selected <- eventReactive(input$update, {
    each_var <- map(vars(), ~ filter_var(dataset()[[.x]], input[[.x]]))
    reduce(each_var, `&`)
  })
  
  # filter df
  selected_df <- eventReactive(input$update, dataset()[selected(), ] %>% 
    filter(area_type == input$area_type))
  
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
  
  # join values to polygons based on area type
  plot_spdf <- eventReactive(input$update, {
    if (input$area_type == "health board") {
      spdf <- join_with_shapes(selected_df(), hb_shapes)
    } else if (input$area_type == "local authority") {
      spdf <- join_with_shapes(selected_df(), la_shapes)
    }
  })
  
  # plot polygons
  observe({
    if (nrow(selected_df()) == 0) {
        leafletProxy("scotland_map") %>% 
          clearShapes() %>% 
          addLabelOnlyMarkers(
            lng = -5, lat = 58,
            label = "No Data",
            labelOptions = labelOptions(noHide = T, textsize = "32px")
          )
    } else {
    add_coloured_polygons(
      basemap = "scotland_map", spdf = plot_spdf(),
      colour_scheme = input$colour_choice,
      units = dfs[[input$dataset]]$units
    )
    }
  })
  # plot legend
  observe({
    leafletProxy("scotland_map") %>% 
      clearControls()
    
    if (input$legend & nrow(selected_df())!=0)  {
      add_legend(
        "scotland_map", spdf = plot_spdf(),
        colour_scheme = input$colour_choice,
        title = input$dataset
      )}
  })
}