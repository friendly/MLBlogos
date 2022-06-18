library(dplyr)
library(rvest)
library(stringr)
library(glue)
library(here)

#' Previously edited HTML file containing `<img src=` for each MLB team
file <- here("data-raw", "MLB-logos/www.sportslogos.net_teams_2021.htm")

html <- read_html(file)

#' extract the img tags
img <- html |>
  html_elements("img") |>
  html_attr("src")

#' extract the team names from the `<a href="..">team</a>` tags
team <- html |> html_nodes("a") |>
  html_text() |>
  str_replace("[\\r\\n\\t ]*", "") |>
  str_replace("\\t*", "")

png <- list.files("png")
Logos <- data.frame(name = team, png, img_src = img)
head(Logos)


library(Lahman)

# get the variables we need from the Teams dataset
Teams |>
  filter(yearID == 2021) |>
  select(teamID, lgID, divID) |>
  mutate(divID = factor(divID)) |>
  droplevels()                   -> teamInfo


cbind(teamInfo, Logos) -> Logos

#' save the Logos data frame
save(Logos, file="data/Logos.RData")

#usethis::use_data(Logos, overwrite = TRUE)

#' Make documentation
#' Why isn't there a roxygen equivalent of prompt?
prompt(Logos)                    # write Logos.Rd

library(Rd2roxygen)
info <- parse_file("Logos.Rd")   # read back in
roxy <- create_roxygen(info)     # roxyize
write(roxy, file="Logos.R")      # write doc file




