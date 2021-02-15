add_coloured_polygons <- function(basemap, spdf, colour_scheme = "YlOrRd",
                                  units = "") {
  # pretty labels
  labels <- sprintf(paste0("<strong>%s</strong><br/>%g ",units),
                    spdf$area_name, spdf$value) %>%
    lapply(htmltools::HTML)
  
  # add polygons highlight on hover
  leafletProxy(basemap) %>%
    clearShapes() %>%
    clearMarkers() %>% 
    addPolygons(data = spdf, color = "white",
                fillColor = ~colorNumeric(
                  colour_scheme, (-spdf$value))
                (-spdf$value),
                weight = 1, fillOpacity = 0.8, label = labels,
                highlightOptions = highlightOptions(
                  color = "black", weight = 2,
                  opacity = 0.9, bringToFront = TRUE))
}


add_legend <- function(basemap, spdf, colour_scheme = "YlOrRd",
                       title = "") {
  leafletProxy(basemap) %>%
    addLegend(pal = colorNumeric(
      colour_scheme, (-spdf$value)),
      values = -spdf$value, opacity = 0.6,
      title = title,
      position = "bottomright")
}