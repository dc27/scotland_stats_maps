ui <- dashboardPage(
  dashboardHeader(title = "Scotland Stats Maps"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$style(
      type = "text/css",
      "
      #scotland_map {height: calc(100vh - 160px) !important;}
      #basic_bar {height: calc(100vh - 160px) !important;}
      "
      ),
    fluidRow(
      column(
        9,
        tabBox(
          width = 12,
          title = textOutput("title"),
          tabPanel(
            "Map",
            leafletOutput("scotland_map")
          ),
          tabPanel(
            "Plot",
            plotOutput("basic_bar")
          ),
          tabPanel(
            "Data",
            tableOutput("table")
          )
        )
      ),
      column(
        3,
        fluidRow(
          box(
            width = 12,
            tags$h4("Dataset Options"),
            selectInput(
              "dataset", label = "Dataset", choices = sort(names(dfs))
            ),
            tags$hr(),
            uiOutput("dropdowns"),
            tags$hr(),
            selectInput(
              "area_type",
              "Area Type",
              c("Health Board" = "health board",
                "Local Authority" = "local authority"),
              "Health Board"
            ),
            tags$hr(),
            tags$h4("Map Options"),
            fluidRow(
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
            ),
            actionButton("update", "Update")
          )
        )
      )
    )
  )
)
  
