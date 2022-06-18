library(Lahman)
library(dplyr)
library(ggplot2)
library(ggimage)

data(Salaries)

# Total team salaries by league, team for 2016, last year available??
teamSalaries <- Salaries |>
  filter(yearID == max(yearID),
         lgID == "AL") |>
  group_by(teamID) |>
  summarise(Salary = sum(as.numeric(salary))) |>
#  group_by(lgID) |>
  arrange(Salary) |>
  mutate(teamID = factor(teamID, levels = unique(teamID)))

ggplot(teamSalaries,
       aes(teamID, Salary)) +
  geom_col() +
  scale_y_continuous(labels = scales::label_number(suffix = " M", scale = 1e-6)) +  # millions
  ylab("Total Salary") +
  coord_flip()




