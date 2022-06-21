library(Lahman)
library(dplyr)
library(ggplot2)
library(ggimage)

data(Salaries)
data(Logos)

# Total team salaries by league, team for 2016 (last year available)
teamSalaries <- Salaries |>
  filter(yearID == max(yearID),
         lgID == "AL") |>
  group_by(teamID) |>
  summarise(Salary = sum(as.numeric(salary))) |>
  arrange(Salary) |>
  # re-order levels for plotting
  mutate(teamID = factor(teamID, levels = unique(teamID)))

# get the logo for each team
teamSalaries <- teamSalaries |>
  left_join(Logos, by="teamID") |>
  mutate(img = system.file(glue::glue("png/{png}"),
                           package = "MLBlogos")) |>
  select(teamID, name, Salary, divID, img)


ggplot(teamSalaries,
       aes(teamID, Salary)) +
  geom_col(aes(fill=divID)) +
  scale_y_continuous(labels = scales::label_number(suffix = " M",
                                                   scale = 1e-6)) +  # millions
  scale_fill_discrete(
    labels = c("Central", "East", "West")
    ) +
  geom_image(aes(image=img, y = .6 *Salary),
             size=0.08) +
  labs(y = "Total Salary",
       fill = "Division") +
  coord_flip() +
  theme_bw(base_size=16) +
  theme(legend.position = c(.9, .2))



