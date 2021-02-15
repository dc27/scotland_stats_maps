library(rgdal)
library(dplyr)
library(rgeos)

crs <- CRS("+proj=longlat +datum=WGS84")

# ----- health boards ----- 
hb_shapes <- readOGR(
  dsn ="data/raw_shapefiles/SG_NHS_HealthBoards_2019",
  layer = "SG_NHS_HealthBoards_2019",
  GDAL1_integer64_policy = TRUE)

# transform shape data to plot on map
hb_shapes_ll <- hb_shapes %>% 
  # simplifiy polygons to speed up load times
  gSimplify(tol=25, topologyPreserve=TRUE) %>% 
  spTransform(crs)

hb_shapes@polygons <- hb_shapes_ll@polygons

# clean col names and change hb_name to generic: area_name
hb_shapes@data <- hb_shapes@data %>% 
  janitor::clean_names() %>% 
  rename(area_name = hb_name,
         id_code = hb_code)

writeOGR(
  obj = hb_shapes,
  dsn = "data/simplified_shapefiles/NHS_HealthBoards_2019",
  layer = "NHS_HealthBoards_2019",
  driver = "ESRI Shapefile",
  overwrite_layer = TRUE)

# ----- local authorities ----- 

la_shapes <- readOGR (
  dsn = "data/raw_shapefiles/local_authorities",
  layer = "district_borough_unitary_region",
  GDAL1_integer64_policy = TRUE
)

la_shapes_ll <- la_shapes %>% 
  rgeos::gSimplify(tol=25, topologyPreserve=TRUE) %>% 
  spTransform(crs)

la_shapes@polygons <- la_shapes_ll@polygons

# select only Scottish local authorities
la_shapes <- la_shapes[str_detect(la_shapes$CODE, "^S"),]

# remove superfluous info, rename name to standard: area_name
la_shapes@data <- la_shapes@data %>%
  janitor::clean_names() %>% 
  rename(area_name = name,
         id_code = code)

writeOGR(
  obj = la_shapes,
  dsn = "data/simplified_shapefiles/scottish_local_authorities",
  layer = "scottish_local_authorities",
  driver = "ESRI Shapefile",
  overwrite_layer = TRUE)
