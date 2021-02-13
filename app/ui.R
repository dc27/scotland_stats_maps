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
        fluidRow(
          tabBox(
            width = 12,
            tabPanel(
              "Dataset Options",
              tags$br(),
              selectInput(
                "date_range",
                "Reference Period",
                hle_reference_periods,
                "2015-2017"
                ),
              selectInput(
                "sex",
                "Sex",
                c("Female" = "female",
                  "Male" = "male"),
                "Female"
              )
            )
          )
        ),
        fluidRow(
          tags$h3("Plot Options"),
          tabBox(
            width = 12,
            tabPanel(
              "Basic",
              checkboxInput("legend", "Show legend", TRUE)
            ),
            tabPanel(
              "Advanced",
              selectInput(
                "colour_choice",
                "Colour Palette",
                colour_pals,
                "YlOrRd"
              )
            )
          )
        )
      )
    )
  )
)
  
