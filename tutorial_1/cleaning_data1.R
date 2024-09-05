#### Preamble ####
#title: "Cleaning Canadian Elections Data"
#author: "Group 10"
#date: "2024-09-05"
#output: html_document


### Basic cleaning ###

election_data <- read_csv("tutorial_1/table_tableau11.csv")
head(election_data)

# Clean the column names
cleaned_election_data <- 
  clean_names(election_data)

head(cleaned_election_data)

colnames(election_data)

cleaned_election_data <- 
  cleaned_election_data |>
  select(
    electoral_district_name_nom_de_circonscription,
    elected_candidate_candidat_elu
  )

head(cleaned_election_data)

# Renaming columns 
names(cleaned_election_data)

cleaned_election_data <-
  cleaned_election_data |>
  rename(
    division = electoral_district_name_nom_de_circonscription,
    elected_party = elected_candidate_candidat_elu
  )

head(cleaned_election_data)


cleaned_election_data <- 
  cleaned_election_data |>
  separate(
    col = elected_party, 
    into = c("Other", "elected_party"),
    sep = "/"
  ) |>
  select(-Other)

head(cleaned_election_data)

# View unique values in the elected party column 
cleaned_election_data$elected_party |>
  unique()

# Separate English and French 
cleaned_election_data <-
  cleaned_election_data |>
  mutate(
    elected_party =
      case_match(
        elected_party,
        "Libéral" ~ "Liberal",
        "Conservateur" ~ "Conservative",
        "Bloc Québécois" ~ "Bloc Québécois",
        "NPD-Nouveau Parti démocratique" ~ "NDP-New Democratic Party",
        "Parti Vert" ~ "Green Party"
      )
  )

head(cleaned_election_data)


# Write csv 
write_csv(
  x = cleaned_election_data,
  file = "tutorial_1/cleaned_election_data.csv"
)
