ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$style(
      type = "text/css",
      "#scotland_map {height: calc(100vh - 80px) !important;}"
      ),
    leafletOutput("scotland_map"),
    absolutePanel(id = "controls",
                  class = "panel panel-default", fixed = TRUE, draggable = TRUE,
                  top = 150, left = "auto", right = 20, bottom = "auto",
                                width = 500, height = "auto",
                  selectInput("date_range", "Reference Period",
                              hle_reference_periods,
                              "2015-2017"
                  ),
                  selectInput("sex", "Sex",
                              sexes,
                              "female" 
                              
                  ),
                  checkboxInput("legend", "Show legend", TRUE)
    )
    )
)
  
