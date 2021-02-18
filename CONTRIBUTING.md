# Quick Contributions:

Add a dataset to the app! Currently, 4 of approximately 200 datasets have been
cleaned and incorporated into the app. The full list is here:
[ods_dataset_lookup](data/clean_data/ods_dataset_lookup.csv). 

After forking this repo

1. Pick a dataset from the list and investigate it using either the
(`opendatascot`)[https://github.com/DataScienceScotland/opendatascot] library or
finidng the dataset on [statistics.gov.scot](https://statistics.gov.scot/home).
Make sure the dataset fits the following criteria:

   + does not currently exist within the app
   + has associated datazones - health boards (S08....), or local
authorities (council areas, S12....)

2. Get to know the data
   + decide which variables **should** be able to be explored by the user in the
app

3. Decide what changes must be made to the dataset to bring it into accordance
with the standard for the app. Expected form:

|area_code|reference_area|area_type|exploratory_vars(depends on dataset)|value|
|-|-|-|-|-|
|S12000033|Aberdeen City|local authority|2005-2007|100

For consistency in the ui, explanatory vars should be limited to 4 (max.) and
any reference period/year vars should be listed first.

4. Clean and wrangle the data so that it is in the standard form for the app.
Variables should be snake_case.

Have a look at and follow the style of [cleaning_script](scripts/cleaning.R).

5. Update the cleaning script

6. Update the file [list_of_dfs.R](list_of_dfs.R)

The first level of the list contains categories or "themes" from [statistics.gov.uk](https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fconcept%2Ffolders%2Fthemes).
Each category is a list of lists. When adding the now-cleaned dataset follow
this pattern:

```
"dataset_name(from statistics.gov)" = list(
  data = read_csv("data/clean_data/clean_dataset.csv"),
  explorable_vars = c("var_1", "var_2"),
  explorable_areas = "local authority",
  units = "things",
  reverse_colours = FALSE (default is light colour for low numbers, to reverse this, change this value to TRUE),
  by_pop = FALSE, (if it's useful to allow the user to compare the value/1000 people then set this to TRUE),
  url = "link_to_data",
  notes = "The data was collected every three years."
)
```
e.g.
```
"Council House Sales" = list(
  data = read_csv("data/clean_data/council_house_sales.csv"),
  explorable_vars = c("year", "dwelling_type"),
  explorable_areas = c("health board", "local authority"),
  units = "dwellings",
  reverse_colours = FALSE,
  by_pop = TRUE,
  url = "",
  notes = ""
)
```
7. Test the app (both for your added dataset and previous (working) datasets)

8. Open pull request

It's recommended to create a Git branch for each PR and please limit one dataset
addition per pull request.

# Thoughtful Contributions:

Alterations to the app. (e.g. more functionality.)

Making use of the `opendatascot` package for more readable and maintainable
practice.