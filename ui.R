sidebar <- dashboardSidebar(
  collapsed = TRUE,
  # use sidebar for easy navigation
  sidebarMenu(
    id = "sidebar_menu",
    menuItem("Map", tabName = "map", icon = icon("map-o")),
    menuItem("Graph", tabName = "graph", icon = icon("bar-chart")),
    menuItem("Data", tabName = "data", icon = icon("file-o"))
    )
  )

ui <- dashboardPage(
  header = dashboardHeader(
    title = tagList(
      span(class = "logo-lg", "Scotland Stats Maps"), 
      img(src = "scotland.svg")),
    controlbarIcon = "gears"
  ),
  sidebar,
  dashboardBody(
  tags$head(
      tags$link(rel="stylesheet", type="text/css", href="app_styles.css"),
      tags$script(src = "heights.js")
    ),
    fluidRow(
      column(
        5,
        box(
          id = "input_options",
          title = "Options",
          width = 12,
          fluidRow(
            tabBox(
              id = "child_inputs",
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
                  c("Local Authority", "Health Board"),
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
            ),
            tags$div(style = "text-align:center;",
                     actionButton("update", "Update"))
          )
        )
      ),
      column(
          7,
          box(
            id = "map_container",
            width = 12,
            title = textOutput("title"),
            tabItems(
              tabItem(
                tabName = "map",
                leafletOutput("scotland_map")
            ),
            tabItem(
              tabName = "graph",
              plotOutput("basic_bar")
            ),
            tabItem(
              tabName = "data",
              "Source: ",
              uiOutput("short_url"),
              tableOutput("table")
            )
          )
        ),
        tagList(tags$div("Icons made by",tags$a(href="https://www.flaticon.com/authors/freepik", title="Freepik","Freepik"), "from", tags$a(href="https://www.flaticon.com/",title="Flaticon", "www.flaticon.com")))
      )
    )
  )
)



# column(
#   3,
#   box(
#     title = "Notes",
#     width = 12,
#     uiOutput("notes")
#   )
# )
# )     
