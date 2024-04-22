#### Preamble ####
# Purpose: 
# Author: YanYu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites:None



library(tidyverse)
library(janitor)
library(knitr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/Shootings.csv")
head(raw_data)
shootings_data <-
  clean_names(raw_data)
head(shootings_data)

Cleaned_shootings_data <-
  shootings_data |>
  filter(
    occ_year >= 2013 & occ_year <= 2023,
    
  ) |> select( occ_year,occ_dow, occ_time_range,death,injuries,) |>
  rename(
    `year` = occ_year ,
    `Week` = occ_dow,
    `timerange` = occ_time_range, 
    `death` = death,
    `injuries`= injuries,
     )
head(Cleaned_shootings_data)


##Calculate total shootings per year##
yearly_summary <- shootings %>%
  filter(year >= 2013, year <= 2023) %>%
  group_by(year) %>%
  summarise(
    total_deaths = sum(death, na.rm = TRUE),
    total_injuries = sum(injuries, na.rm = TRUE),
    .groups = 'drop'
  )
head(yearly_summary)


## Summarize the data to calculate total deaths and injuries by time period##
Shootings_time_period <- shootings %>%
  filter(year >= 2013, year <= 2023) %>%
  group_by(year,timerange) %>%
  summarise(
    Total_Deaths = sum(death, na.rm = TRUE), 
    Total_Injuries = sum(injuries, na.rm = TRUE),# Sum up deaths, handling missing values
    .groups = 'drop'
  )

head(Shootings_time_period)


# Summarize the data to calculate total deaths by week
Shootings_Weektime_data <- shootings %>%
  group_by(Week) %>%
  summarise(
    Total_Deaths = sum(death, na.rm = TRUE), 
    Total_Injuries = sum(injuries, na.rm = TRUE),# Sum up deaths, handling missing values
    .groups = 'drop'
  )

head(Shootings_Weektime_data)








#### save data####
write_csv(
  x = Cleaned_shootings_data,
  file = "data/analysis_data/Cleaned_shootings_data.csv"
)


write_csv(
  x = yearly_summary,
  file = "data/analysis_data/yearly_summary.csv"
)


write_csv(
  x = Shootings_time_period,
  file = "data/analysis_data/Shootings_time_period.csv"
)

write_csv(
  x = Shootings_Weektime_data,
  file = "data/analysis_data/Shootings_Weektime_data.csv"
)

