library(tidyverse)
library(readxl)

WorldPopulation <- read_excel("data-raw/World_Population.xlsx", sheet = "ESTIMATES", skip = 16)
WorldPopulation <- WorldPopulation %>%
  filter(Type != "Label/Separator") %>%
  filter(Type == "Country/Area") %>%
  select("Region, subregion, country or area *", matches("^(19[5-9][0-9]|20[0-1][0-9]|2020)$")) %>%
  rename(Country = `Region, subregion, country or area *`) %>%
  pivot_longer(
    cols = `1950`:`2020`,
    names_to = "Year",
    values_to = "Population"
  ) %>%
  mutate(Year = as.numeric(Year)) %>%
  mutate(Population = as.numeric(Population))

usethis::use_data(WorldPopulation)

