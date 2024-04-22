#### Preamble ####
# Purpose: 
# Author: Yanyu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites: 02-data_cleaning.R

#install.packages("rstanarm")

#install.packages("opendatatoronto")

library(tidyverse)
library(rstanarm)
library(here)


#### Read data ####

timeperiod <-read_csv("data/analysis_data/Shootings_time_period.csv")



### Model data ####
set.seed(339)

# Create time index
shootings_death_model <-
  lm(
    Total_Deaths ~ timerange,
    data = timeperiod
    
  )
summary(shootings_death_model)


shootings_injuries_model <-
  lm(
    Total_Injuries ~ timerange,
    data = timeperiod
    
  )
summary(shootings_injuries_model)



#### Save model ####

saveRDS(
  shootings_death_model,
  file = here::here("models/shootings_death_model.rds"))


saveRDS(
  shootings_injuries_model,
  file = here::here("models/shootings_injuries_model.rds"))




