library(tidyverse)
library(MorenoWorldPopulation)

CountryPopulation <- function(country_name) {
  country_data <- subset(WorldPopulation, Country == country_name)

  if(nrow(country_data) == 0){
    return(NULL)
  }

  countryPlot <- ggplot(country_data, aes(x = Year, y = Population)) +
    geom_line() +
    geom_point() +
    labs(title = paste("Population:", country_name),
         x = "Year",
         y = "Population") +
    theme_minimal()
}
usethis::use_data(CountryPopulation)
