#' ---
#' title: Download MLB logo images from www.sportslogos.net
#' ---

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

Logos <- data.frame(team, img)
head(Logos)

#' download GIF images, make cleaned-up team name the filename
for (i in 1:nrow(Logos)) {
  file <- str_replace(team[i], "\\.", "")
  file <- str_replace_all(file, " ", "_")
  file <- glue("gif/{file}.gif")
  download.file(Logos[i, "img"], file, mode="wb", quiet = TRUE)
  cat("downloading: ", team[i], "\t- > ",file, "\n")
}
