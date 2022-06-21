library(Lahman)
library(dplyr)
library(ggplot2)
library(ggimage)

data(Teams, package="Lahman")
data(Logos)

# ------------------------------------------
# get Xs and wins for most recent year, 2021
# ------------------------------------------
teamdata <- Teams |>
  filter(yearID == max(yearID)) |>
  select(teamID, HR, W, attendance)

# ------------------------------------------
# get the logo for each team
# ------------------------------------------
teamdata <- teamdata |>
  left_join(Logos, by="teamID") |>
  mutate(img = system.file(glue::glue("png/{png}"),
                           package = "MLBlogos")) |>
  select(teamID, divID, HR, W, attendance, img)


# ------------------------------------------
# plot home runs and wins
# ------------------------------------------
ggplot(data=teamdata,
       aes(x = HR, y=W)) +
  geom_point() +
  geom_smooth(method = "loess", formula = y~x, se = FALSE) +
  geom_image(aes(image=img, x = HR, y = W),
             size=0.05) +
  labs(x = "Home Runs",
       y = "wins") +
  theme_bw(base_size = 16)


# ------------------------------------------
# plot attendance and wins
# ------------------------------------------
ggplot(data=teamdata,
       aes(x = attendance, y=W)) +
  geom_point() +
  geom_smooth(method = "loess", formula = y~x, se = FALSE) +
  geom_image(aes(image=img, x = attendance, y = W),
             size=0.05) +
  scale_x_continuous(labels = scales::label_number(suffix = " K",
                                                   scale = 1e-3)) +
  labs(x = "Attendance",
       y = "wins") +
  theme_bw(base_size = 16)




