# Libraries 
library(tidyverse)
library(palmerpenguins)
library(ggplot2)


# Question 1
# The following produces a histogram showing the annual number of sunspots between 1700 and 1988. Work in your group to improve it.

tibble(year = 1700:1988,
       sunspots = as.numeric(datasets::sunspot.year) |> round(0)) |>
  ggplot(aes(x = sunspots)) +
  geom_histogram() +


# Question 2
# The following code, taken from the palmerpenguins vignette, produces a beautiful graph. Work in your group to modify it to create the ugliest graph that you can.

ggplot(data = penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g)) +
  geom_point(aes(color = species,
                 shape = species),
             size = 3,
             alpha = 0.8) +
  scale_color_manual(values = c("darkorange", "purple", "cyan4")) +
  labs(
    title = "Penguin size, Palmer Station LTER",
    subtitle = "Flipper length and body mass for Adelie, Chinstrap and Gentoo Penguins",
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    color = "Penguin species",
    shape = "Penguin species"
  ) +
  theme_minimal() +
  theme(
    legend.position = c(0.2, 0.7),
    plot.title.position = "plot",
    plot.caption = element_text(hjust = 0, face = "italic"),
    plot.caption.position = "plot"
  )
