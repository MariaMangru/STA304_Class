#### Preamble ####
#title: "Simulate Canadian Elections"
#author: "Group 10"
#date: "2024-09-05"
#output: html_document
  
# Load libraries
library(tidyverse)
library(janitor)

# Simulate data for 338 riding
set.seed(123) 

ridings <- tibble(
  riding_number = 1:338,
  party = sample(c("Liberal", "Conservative", "Bloc Québécois", "New Democratic", "Green", "Independent"),
                 size = 338, replace = TRUE)
)

head(ridings)