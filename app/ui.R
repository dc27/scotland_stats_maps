ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$style(
      type = "text/css",
      "#scotland_map {height: calc(100vh - 80px) !important;}"
      ),
    fluidRow(
      column(
        9,
        leafletOutput("scotland_map")
      ),
      column(
        3,
        tags$br(),
        id = "controls",
        selectInput(
          "date_range",
          "Reference Period",
          hle_reference_periods,
          "2015-2017"
          ),
        selectInput(
          "sex",
          "Sex",
          sexes,
          "female"
        ),
        checkboxInput("legend", "Show legend", TRUE)
      )
    )
  )
)
  
