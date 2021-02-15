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
              selectInput("dataset", label = "Dataset", choices = sort(names(dfs)
              )),
              uiOutput("dropdowns"),
              selectInput(
                "area_type",
                "Area Type",
                c("Health Board" = "health board",
                  "Local Authority" = "local authority"),
                "Health Board"
              ),
              actionButton("update", "Update Map")
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
  
