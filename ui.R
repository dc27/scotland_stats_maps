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
      # Data Vis
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
            "Source: ",
            uiOutput("short_url"),
            tableOutput("table")
          )
        )
      ),
      # Input Options
      column(
        3,
        fluidRow(
          box(
            width = 12,
            tags$h4("Options"),
            fluidRow(
              tabBox(
                width = 12,
                tabPanel(
                  "Input",
                  selectInput(
                    "category",
                    label = "Theme",
                    choices = sort(names(dfs)),
                    selected = "Population"
                  ),
                  selectInput(
                    "dataset", label = "Dataset", choices = NULL
                  ),
                  tags$hr(),
                  uiOutput("dropdowns"),
                  uiOutput("pop_button"),
                  tags$hr(),
                  selectInput(
                    "area_type",
                    "Area Type",
                    c("Health Board" = "health board",
                      "Local Authority" = "local authority"),
                    "Health Board"
                  )
                ),
                tabPanel(
                  "Appearance",
                  checkboxInput("legend", "Show legend", TRUE),
                  selectInput(
                    "colour_choice",
                    "Colour Palette",
                    colour_pals,
                    "YlOrRd"
                  )
                )
              )
            ),
            textOutput("notes"),
            tags$div(style = "text-align:center;",
                     actionButton("update", "Update"))
          )
        )
      )
    )
  )
)
  
