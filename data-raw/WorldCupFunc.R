library(tidyverse)
link <- "https://en.wikipedia.org/wiki/FIFA_World_Cup"
page <- read_html(link)

tables <- page %>% html_elements("table")
targetTable <- tables[[4]] %>% html_table()
targetTable


tf <- targetTable[-1, ]

World_Cup <- tf %>%
  select('Year', 'Hosts', 'Matches', 'Totalattendance †', 'Averageattendance')

World_Cup <- setNames(World_Cup, c('Year', 'Hosts', 'Matches', 'Total Attendance', 'Average Attendance')) %>%
  mutate(`Average Attendance` = as.integer(str_remove_all(`Average Attendance`, ","))) %>%
  mutate(`Total Attendance` = as.integer(str_remove_all(`Total Attendance`, ","))) %>%
  mutate(Matches = as.integer(str_remove_all(Matches, ","))) %>%
  drop_na() %>%
  filter(Year != "Overall")

World_Cup <- World_Cup %>%
  mutate(WorldCup = paste(World_Cup$Hosts, World_Cup$Year, sep = "")) %>%
  select(WorldCup, Matches, `Total Attendance`, `Average Attendance`)

usethis::use_data(World_Cup)
