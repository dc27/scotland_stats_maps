source("R/filter_and_join_df_functions.R")
source("R/plot_functions.R")

server <- function(input, output, session){
  category <- reactive({
    input$category
  })
  
  observeEvent(category(), {
    updateSelectInput(input = "dataset", choices = names(dfs[[input$category]])) 
  })
  
  # dynamic ui
  title <- eventReactive(input$update, {input$dataset})
  dataset <- reactive(dfs[[input$category]][[input$dataset]]$data)
  vars <- reactive(dfs[[input$category]][[input$dataset]]$explorable_vars)
  
  output$dropdowns <- renderUI(
    map(vars(), ~ make_dropdown(dataset(), .x))
  )
  
  by_pop <- reactive({
    dfs[[input$category]][[input$dataset]]$by_pop & input[["year"]] >= 2001
  })

  output$pop_button <- renderUI({
    # make sure by_pop() has a value before continuing (mutes warning)
    req(by_pop())
    
    div(
      if (by_pop()) {
        checkboxInput("population", "Per 1000 persons", FALSE)
      })
    })
  
  output$title <- renderText({
    title()
  })

  # user inputs for dynamic vars
  selected <- eventReactive(input$update, {
    each_var <- map(vars(), ~ filter_var(dataset()[[.x]], input[[.x]]))
    reduce(each_var, `&`)
  })

    
  # filter df
  selected_df <- eventReactive(input$update, {
    browser()
    if ((by_pop() == FALSE) | !isTruthy(input$population)) {
      dataset()[selected(), ] %>% 
        filter(area_type == input$area_type)
    } else {
      # if population has been selected, change measurement to measurement/1000
      # persons
      
      # filter population data before join
      filtered_pop_data <- eventReactive(input$update, {
        if ("year" %in% names(input)) {
          dfs$Population$`Population Estimates`$data %>% 
            filter(year == input[["year"]]) %>% 
            filter(sex == "All")
        }
      })
      
      # join with pop data, calculate, and change col names.
      dataset()[selected(), ] %>% 
        filter(area_type == input$area_type) %>% 
        left_join(select(filtered_pop_data(), c(area_code, population = value)),
                  by = c("area_code" = "area_code")) %>% 
        mutate(per_1000 = value/(population/1000),
               per_100000 = value/(population/100000)) %>% 
        select(-value) %>% 
        rename(value = per_1000)
    }
    })
  
  # get units. update if option selected: per 1000persons
  units <- eventReactive(input$update, {
    if ((by_pop() == FALSE) | input$population != TRUE) {
      dfs[[input$category]][[input$dataset]]$units
    } else {
      paste0(dfs[[input$category]][[input$dataset]]$units, " per 1000persons")
    }
  })


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
  
  
  # plot polygons (if there is data)
  colours <- eventReactive(input$update, input$colour_choice)
  
  observeEvent(input$update, {
    if (nrow(selected_df()) == 0) {
      leafletProxy("scotland_map") %>% 
        clearShapes() %>% 
        clearMarkers() %>% 
        addLabelOnlyMarkers(
          lng = -5, lat = 58,
          label = "No Data",
          labelOptions = labelOptions(noHide = T, textsize = "32px")
          )
    } else {
      add_coloured_polygons(
        basemap = "scotland_map", spdf = plot_spdf(),
        colour_scheme = colours(),
        units = units()
      )
    }
  })
  
  
  # plot legend
  observeEvent(input$update, {
    leafletProxy("scotland_map") %>% 
      clearControls()
    
    if (input$legend & nrow(selected_df())!=0)  {
      add_legend(
        "scotland_map", spdf = plot_spdf(),
        colour_scheme = colours(),
        title = title(),
        units = units()
      )}
  })

  # basic bar plot
  output$basic_bar <- renderPlot({
    basic_bar(selected_df(), units())
  }, height = "auto")
  
  # url output
  data_url <- eventReactive(input$update, {
    dfs[[input$category]][[input$dataset]]$url
  })
  
  output$short_url <- renderUI({
    a(href = data_url(), "statistics.gov.scot", target = "_blank")
  })
  
  # table output
  output$table <- renderTable(selected_df())
}