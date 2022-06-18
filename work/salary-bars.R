library(Lahman)
library(dplyr)
library(ggplot2)
library(ggimage)

data(Salaries)

# Total team salaries by league, team for 2016, last year available??
teamSalaries <- Salaries |>
  filter(yearID == 2016) |>
  group_by(teamID) |>
  summarise(Salary = sum(as.numeric(salary))) |>
#  group_by(lgID) |>
  arrange(desc(Salary))

ggplot(teamSalaries,
       aes(teamID, Salary)) +
  geom_col() +
  coord_flip()



