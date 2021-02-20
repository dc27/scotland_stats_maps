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
        select(-value) %>% 
        rename(value = per_1000)
    }
    })
  
  fixed_values <- eventReactive(input$update, {
    coerce_values(selected_df())
  })
  
  
  # get units. update if option selected: per 1000persons
  units <- eventReactive(input$update, {
    # if measure type exists - measure type decides
    # else if population box is ticked - decides
    # else use units provided with data
    
    if (("measure_type" %in% names(input)) && (input$measure_type == "Ratio")) {
      "%%"
    } else if (("population" %in% names(input)) && (input$population)) {
      paste0(dfs[[input$category]][[input$dataset]]$units, " per 1000persons")
    } else {
      dfs[[input$category]][[input$dataset]]$units
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
      spdf <- join_with_shapes(fixed_values(), hb_shapes)
    } else if (input$area_type == "local authority") {
      spdf <- join_with_shapes(fixed_values(), la_shapes)
    }
  })
  
  
  # plot polygons (if there is data)
  colours <- eventReactive(input$update, input$colour_choice)
  
  observeEvent(input$update, {
    # dev/testing! - this is a good spot for a break-point
    # browser()
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
  
  # table output
  output$table <- renderTable(fixed_values() %>% 
                                select(-area_type))
}