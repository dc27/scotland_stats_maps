

auto_join_dz_lookup <- function(
  data, right_index = FeatureCode, left_index = area_code
  ) {
  require(dplyr)
  
  left_index <- enquo(left_index)
  right_index <- enquo(right_index)
  
  by <- set_names(quo_name(left_index), quo_name(right_index))
  
  df <- inner_join(data, datazone_lookup, by = by)
  
  return(df)
}