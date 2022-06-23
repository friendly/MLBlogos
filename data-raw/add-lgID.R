# add lgID to Logos

library(dplyr)

Teams |>
  filter(yearID == 2021) |>
  select(teamID, lgID, divID) |>
  mutate(divID = factor(divID)) |>
  droplevels()                   -> teamInfo

data(Logos)

Logos <- Logos |>
  left_join(teamInfo[,-3], by="teamID") |>
  relocate(lgID, .after = "teamID")
str(Logos)

save(Logos, file="data/Logos.RData")

# rename png -> img; png as a variable causes too many problems
data(Logos)
Logos <- Logos |>
  rename(img = png)

save(Logos, file="data/Logos.RData")

