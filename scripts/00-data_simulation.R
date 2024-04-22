#### Preamble ####
# Purpose: 
# Author: Yanyu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites: None




#### Workspace setup ####
# setup all libraries
#### Workspace setup ####

library(tibble)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(janitor)


#### Simulate data ####

# Define the years and days of the week
years <- 2011:2023
days_of_week <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

# Define time categories
time_of_day <- c("morning", "afternoon", "night", "evening")

# Simulate the number of shootings
set.seed(233) # For reproducibility
simulated_data <- expand.grid(year = years,
                              day_of_week = days_of_week,
                              time_of_day = time_of_day) %>%
  mutate(
    shootings_deaths = sample(20:100, nrow(.), replace = TRUE),  # Random numbers for deaths
    shootings_injuries = sample(80:400, nrow(.), replace = TRUE)  # Random numbers for injuries
  )

# View the structured data
print(head(simulated_data))



#write_csv
write_csv(simulated_data, here::here("data/raw_data/simulated_data.csv"))



