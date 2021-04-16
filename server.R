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
  revColours <- eventReactive(input$update, {
    dfs[[input$category]][[input$dataset]]$reverse_colours
    })
  notes <- eventReactive(
    input$update, {
      str_replace_all(
        dfs[[input$category]][[input$dataset]]$notes,
        "'", "'")
      }
    )
  
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
  
  observe({
    updateSelectInput(
      session, "area_type",
      label = "Area Type",
      choices = unique(dfs[[input$category]][[input$dataset]]$data$area_type),
      selected = unique(
        dfs[[input$category]][[input$dataset]]$data$area_type)[1]
      )
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
    if (!isTruthy(by_pop()) | !isTruthy(input$population)) {
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
        # change units to include population
        mutate(units = paste(units, "per 1000 persons", sep = " ")) %>% 
        select(-value) %>% 
        rename(value = per_1000)
    }
    })
  
  # force numeric values to be integer when integer, otherwise: double
  fixed_values <- eventReactive(input$update, {
    coerce_values(selected_df())
  })
  
  
  # get units
  units <- eventReactive(input$update, {
    potential_units <- unique(fixed_values()$units)
    # remove NAs, select first value in the case where multiple are provided.
    potential_units[!is.na(potential_units)][1]
  })
  
  

  # render basemap
  output$scotland_map <- renderLeaflet({
    leaflet(options = leafletOptions(minZoom = 7)) %>%
      setView(lng = -5, lat = 56, zoom = 7) %>%
      # restrict view to around Scotland
      setMaxBounds(lng1 = -1,
                   lat1 = 54,
                   lng2 = -9,
                   lat2 = 63) %>% 
      addProviderTiles(providers$Esri.WorldGrayCanvas)
  })
  
  # not run - orkney and shetland islands (map already includes northern
  # archipelagos but user has to scroll)
  
  # output$orkney <- renderLeaflet({
  #   leaflet(options = leafletOptions(minZoom = 7)) %>%
  #     setView(lng = -2.95, lat = 59, zoom = 7) %>%
  #     # restrict view to around Scotland
  #     setMaxBounds(lng1 = -2,
  #                  lat1 = 54,
  #                  lng2 = -4,
  #                  lat2 = 63) %>% 
  #     addProviderTiles(providers$Esri.WorldGrayCanvas)
  # })
  # 
  # output$shetland <- renderLeaflet({
  #   leaflet(options = leafletOptions(minZoom = 7)) %>%
  #     setView(lng = -1.26, lat = 60.5, zoom = 7) %>%
  #     # restrict view to around Scotland
  #     setMaxBounds(lng1 = -2.5,
  #                  lat1 = 59.5,
  #                  lng2 = -0.5,
  #                  lat2 = 61.5) %>% 
  #     addProviderTiles(providers$Esri.WorldGrayCanvas)
  # })
  
  
  # join values to polygons based on area type
  plot_spdf <- eventReactive(input$update, {
    if (input$area_type == "Health Board") {
      spdf <- join_with_shapes(fixed_values(), hb_shapes)
    } else if (input$area_type == "Local Authority") {
      spdf <- join_with_shapes(fixed_values(), la_shapes)
    }
  })
  
  
  # plot polygons (if there is data)
  colours <- eventReactive(input$update, input$colour_choice)
  
  observeEvent(input$update, {
    # dev/testing! - this is a good spot for a break-point
    if (nrow(selected_df()) == 0) {
      # no data label
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
        revColours = revColours(),
        units = units()
      )
    }
  })
  
  # plot legend
  observeEvent(input$update, {
    leafletProxy("scotland_map") %>%
      clearControls()

    if (input$legend & nrow(fixed_values())!=0)  {
      add_legend(
        "scotland_map", spdf = plot_spdf(),
        colour_scheme = colours(),
        revColours = revColours(),
        title = title(),
        units = units()
      )}
  })
  
  # display data-specific notes
  output$notes <- renderUI({
    HTML(
      paste(
        paste(
          notes(),
          collapse = "<br><br>"
        ),
        a(href = data_url(), "statistics.gov.scot", target = "_blank")
      )
    )
    
  })

  # basic bar plot
  output$basic_bar <- renderPlot({
    basic_bar(fixed_values(), units())
  }, height = "auto")
  
  # url output
  data_url <- eventReactive(input$update, {
    dfs[[input$category]][[input$dataset]]$url
  })
  
  output$short_url <- renderUI({
    a(href = data_url(), "statistics.gov.scot", target = "_blank")
  })
  
  basic_table_data <- eventReactive(input$update, {
    fixed_values() %>% 
      select(-area_type) %>% 
      arrange(reference_area)
  })
  
  # table output
  output$table <- renderTable({
    data.table::setnames(basic_table_data(), old = names(basic_table_data()),
             new = str_to_title(
               str_replace(names(basic_table_data()), "_", " "))
             )

  })
}