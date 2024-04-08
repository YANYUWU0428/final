#### Preamble ####
# Purpose: 
# Author: Yanyu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites:None

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/Shootings.csv")
head(raw_data)

cleaned_shootings_data <-
  clean_names(raw_data)
head(cleaned_shootings_data)


cleaned_shootings_data <-
  cleaned_shootings_data |>
  filter(
    occ_year >= 2013 & occ_year <= 2023,
    
  ) |> select( occ_year, occ_time_range,division,death,injuries) |>
  rename(
    `year` = occ_year ,
    `timerange` = occ_time_range, 
    `division` = division, 
    `death` = death,
    `injuries`= injuries
          )
 
head(cleaned_shootings_data)


#### Summarize the data by year ####


# Group the data by year and summarize the total deaths and injuries for each year
yearly_summary <- cleaned_shootings_data %>%
  group_by(year) %>%
  summarise(
    Total_Deaths = sum(death, na.rm = TRUE),  # Sum up deaths, removing NA values
    Total_Injuries = sum(injuries, na.rm = TRUE),  # Sum up injuries, removing NA values
    total_cases = n()
  )

# Print the summarized data
print(yearly_summary)



####   ####
cleaned_shootings_data$division |>
  unique()

# Filter records from 2013 to 2023
filtered_data <- cleaned_shootings_data %>%
  filter(year >= 2013, year <= 2023)

# Count shootings by area
shootings_by_division <- filtered_data %>%
  group_by(division) %>%
  summarise(count = n()) %>%
  ungroup()
# Sort by the number of occurrences
division_shootings <- shootings_by_division %>%
  arrange(desc(count))

# View the results
print(division_shootings)



# Count shootings by time of day
shootings_by_time <- division_shootings %>%
  group_by(timerange) %>%
  summarise(count = n()) %>%
  ungroup()

# Step 5: Sort by the number of occurrences
sorted_shootings <- shootings_by_time %>%
  arrange(desc(count))

# View the results
print(sorted_shootings)







#### Save data ####
write_csv(
  x = cleaned_shootings_data,
  file = "cleaned_shootings_data.csv"
)


write_csv(
  x = yearly_summary,
  file = "yearly_summary.csv"
)


