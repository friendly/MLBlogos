library(dplyr)
library(rvest)
library(stringr)
library(glue)

#' Previously edited HTML file containing `<img src=` for each MLB team
setwd("C:/R/Rprojects/MLB-logos")
file <- "C:/R/Rprojects/MLB-logos/www.sportslogos.net_teams_2021.htm"

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

Teams |>
  filter(yearID == 2021) |>
  select(teamID, divID) |>
  mutate(divID = factor(divID)) |> 
  droplevels()                   -> teamInfo


cbind(teamInfo, Logos) -> Logos

#' save the Logos data frame
save(Logos, file="Logos.RData")

#' Make documentation
prompt(Logos)

library(Rd2roxygen)

str(info <- parse_file("Logos.Rd"))
roxy <- create_roxygen(info)
write(roxy, file="Logos.R")




