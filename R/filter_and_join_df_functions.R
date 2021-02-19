make_dropdown <- function(df, var) {
  # convert snakecase variable name to title for ui
  varname <- str_to_title(str_replace(var, "_", " "))
  selectInput(var, varname, sort(unique(df[[var]])))
}

filter_var <- function(x, val) {
    x %in% val
}

coerce_values <- function(df) {
  numeric_cols <- df %>% select(where(is.numeric)) %>% names()
  
  for (col in numeric_cols) {
    if (sum(df[[col]]) %% 1 == 0) {
      df[[col]] <- as.integer(df[[col]])
    } else {
      df[[col]] <- round(df[[col]], 2)
    }
  }
  return(df)
}

# combine measurements with polygon data
join_with_shapes <- function(measurement_df, spdf) {
  spdf@data <- tibble(spdf@data) %>%
    left_join(measurement_df, by = c("id_code" = "area_code"))
  
  return(spdf)
}