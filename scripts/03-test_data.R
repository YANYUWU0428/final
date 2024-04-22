#### Preamble ####
# Purpose: 
# Author: Yanyu Wu
# Date: 30 March 2024
# Contact: yanyu.wu@mail.utoronto.ca
## License: MIT
# Pre-requisites: 02-data_cleaning.R

#### Test data ####

# Read in data


simulated_data <- read.csv("data/raw_data/simulated_data.csv")
cleaned_shootings_data <- read_csv("data/analysis_data/Cleaned_shootings_data.csv")  
yearly <-read_csv("data/analysis_data/yearly_summary.csv")
time_period <-read_csv("data/analysis_data/Shootings_time_period.csv")
Weektime<-read_csv("data/analysis_data/Shootings_Weektime_data.csv")

#### Test simulated data ####
## Test if there are 12 years
simulated_data$year |> min(na.rm = TRUE) >=12

# Check if it is numeric
is.numeric(simulated_data$year)
is.numeric(simulated_data$shootings_deaths)
is.numeric(simulated_data$shootings_injuries)

# Check if it is character
is.character(simulated_data$day_of_week)
is.character(simulated_data$time_of_day)


# Check for Missing Values
missing_values <- sum(is.na(simulated_data))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values in the dataset."))
} else {
  print("No missing values found in the dataset.")
}


#### Test clean data ####


## Test if there are 10 years
cleaned_shootings_data$year |> min(na.rm = TRUE) >=10

# Check if it is numeric
is.numeric(cleaned_shootings_data$year)
is.numeric(cleaned_shootings_data$death)
is.numeric(cleaned_shootings_data$injuries)

# Check if it is character
is.character(cleaned_shootings_data$Week)
is.character(cleaned_shootings_data$timerange)

# Check for Missing Values
missing_values <- sum(is.na(cleaned_shootings_data))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values "))
} else {
  print("No missing values")
}

# Ensure it is non-negative
all(cleaned_shootings_data$death >= 0)
all(cleaned_shootings_data$injuries >= 0)



#### yearly data ####
## Test if there are 10 years
yearly $year |> min(na.rm = TRUE) >=10


# Check for Missing Values
missing_values <- sum(is.na(yearly ))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values "))
} else {
  print("No missing values")
}

# Ensure it is non-negative
all(yearly $total_deaths >= 0)
all(yearly $total_injuries >= 0)

####  time period data ####
## Test if there are 12 years
time_period$year |> min(na.rm = TRUE) >=12
# Check for Missing Values
missing_values <- sum(is.na(time_period  ))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values "))
} else {
  print("No missing values")
}

# Ensure it is non-negative
all(time_period$Total_Deaths >= 0)
all(time_period$Total_Injuries >= 0)


#### week data ####


# Check for Missing Values
missing_values <- sum(is.na(Weektime ))
if (missing_values > 0) {
  print(paste("There are", missing_values, "missing values "))
} else {
  print("No missing values")
}

# Ensure it is non-negative
all(Weektime$Total_Deaths >= 0)
all(Weektime$Total_Injuries >= 0)


