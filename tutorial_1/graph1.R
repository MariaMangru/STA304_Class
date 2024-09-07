#### Preamble ####
#title: "Graphing Canadian Elections Data"
#author: "Group 10"
#date: "2024-09-05"
#output: html_document


#### Read in the data ####
cleaned_election_data <-
  read_csv(
    file = "tutorial_1/cleaned_election_data.csv",
    show_col_types = FALSE
  )

cleaned_election_data |>
  count(elected_party)

# Create graph

cleaned_election_data |>
  ggplot(aes(x = elected_party, fill = elected_party)) +
  geom_bar() +
  theme_minimal() + # Make the theme neater
  labs(title = "Number of Seats Won by Party in the 2021 Canadian Federal Election",
       x = "Party Name",
       y = "Number of Seats") # Make labels more meaningful

