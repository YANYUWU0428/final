#### Preamble ####
# Purpose: This code creates simulated house price data based on information related to the Beijing real estate market over several years and visualizes that data using a ggplot chart that includes points and linear trend lines for each data entry, all within a minimalist theme..
# Author: Yanyu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites: Know where to get Housing price in Beijing



#### Workspace setup ####
# setup all libraries
#### Workspace setup ####
#install.packages("janitor")
#install.packages("tibble")
#install.packages("ggplot2")
#install.packages("tidyverse")
install.packages("dplyr")

library(tibble)
library(ggplot2)
library(tidyverse)
library(janitor)
library(dplyr)

data <- select(data, -url, -id, -Cid)
glimpse(data)



summary(data)

data <- data %>% 
  mutate(district = case_when(district == 1 ~ "DongCheng",
                              district == 2 ~ "FengTai",
                              district == 3 ~ "DaXing",
                              district == 4 ~ "FaXing",
                              district == 5 ~ "FangShang",
                              district == 6 ~ "ChangPing",
                              district == 7 ~ "ChaoYang",
                              district == 8 ~ "HaiDian",
                              district == 9 ~ "ShiJingShan",
                              district == 10 ~ "XiCheng",
                              district == 11 ~ "TongZhou",
                              district == 12 ~ "ShunYi",
                              district == 13 ~ "MenTouGou"))

#### simulation ####
simulation_data <-
  tibble(
    district = rep(x = c("DongCheng", "XiCheng", "ChaoYang", "HaiDian", "FengTai", "ShiJingShan"), each = 7 * 10), # 6 districts, each for 7 years, 10 data points per year
    tradeTime = rep(rep(x = 2011:2017, each = 10), times = 6), # 7 years, 10 data points for each year, repeated for each district
    price = runif(420, min = 2000, max = 5000) # 420 random prices, adjust min and max as needed
  )


head(simulation_data)




