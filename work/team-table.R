# make a table with team logos

library(Lahman)
library(dplyr)
#library(ggplot2)
#library(ggimage)
library(gt)
library(gtExtras)

data(Teams, package="Lahman")
data(Logos)

# ------------------------------------------
# get some variables
# ------------------------------------------
teamtab <- Teams |>
  filter(yearID == max(yearID)) |>
  select(teamID, name, lgID, divID, W, L, HR, H ) |>
  mutate(name = stringr::str_replace(name, " of Anaheim", ""))


# ------------------------------------------
# get the logo for each team
# ------------------------------------------
teamtab <- teamtab |>
  left_join(Logos[, c(1,5)], by="teamID") |>
  mutate(
    img = system.file(paste0("png/", png),
                           package = "MLBlogos")) |>
  select(teamID, name, img, lgID, divID, W, L, HR, H ) # |>

  gt()

