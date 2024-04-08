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
#install.packages("tibble")
#install.packages("ggplot2")
#install.packages("tidyverse")
install.packages("dplyr")

library(tibble)
library(ggplot2)
library(tidyverse)
library(dplyr)



#### Simulate data ####


# Set seed for reproducibility
set.seed(129)

# Create a tibble with simulated data
Simulate_shooting_data <- tibble(
  year_of_shooting = sample(2013:2023, 100, replace = TRUE), # 100 random years between 2000 and 2024
  police_department = sample(paste("Dept", LETTERS[1:5]), 100, replace = TRUE), # Random selection of departments named 'Dept A' to 'Dept E'
  number_of_deaths = sample(1:10, 100, replace = TRUE) # Random number of deaths per incident, ranging from 1 to 10
)

# Print the first few rows of the data
print(Simulate_shooting_data)

