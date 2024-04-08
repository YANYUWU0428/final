#### Preamble ####
# Purpose: 
# Author: Yanyu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites:None

#### Workspace setup ####
install.packages("opendatatoronto")
library(opendatatoronto)
library(tidyverse)

#### Download data ####

# shootings dataset was downloaded from: https://open.toronto.ca/dataset/shootings-firearm-discharges/



shootings_data <-read.csv("data/raw_data/Shootings.csv")


#### Save data ####

write_csv(shootings_data, file="data/raw_data/Shootings.csv")
