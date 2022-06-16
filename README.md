
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MLBlogos

<!-- badges: start -->
<!-- badges: end -->

The goal of MLBlogos is to provide small (150 x 100) logos for the teams
in Major League Baseball (from the 2021 season). A possible use is to
create tables and graphs of Teams data from the [Lahman
package](https://github.com/cdalzell/Lahman).

## Installation

You can install the development version of MLBlogos from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("friendly/MLBlogos")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(MLBlogos)

## Information about the logos is contained in the `Logos` data set. The file name of each logo (in PNG format) is contained in the
## `png` variable. `TeamID` is the matching variable in `Lahman::Teams`.
data(Logos)
knitr::kable(Logos[1:15, 1:4])
```

| teamID | divID | name                 | png                      |
|:-------|:------|:---------------------|:-------------------------|
| ARI    | W     | Arizona Diamondbacks | Arizona_Diamondbacks.png |
| ATL    | E     | Atlanta Braves       | Atlanta_Braves.png       |
| BAL    | E     | Baltimore Orioles    | Baltimore_Orioles.png    |
| BOS    | E     | Boston Red Sox       | Boston_Red_Sox.png       |
| CHA    | C     | Chicago Cubs         | Chicago_Cubs.png         |
| CHN    | C     | Chicago White Sox    | Chicago_White_Sox.png    |
| CIN    | C     | Cincinnati Reds      | Cincinnati_Reds.png      |
| CLE    | C     | Cleveland Indians    | Cleveland_Indians.png    |
| COL    | W     | Colorado Rockies     | Colorado_Rockies.png     |
| DET    | C     | Detroit Tigers       | Detroit_Tigers.png       |
| HOU    | W     | Houston Astros       | Houston_Astros.png       |
| KCA    | C     | Kansas City Royals   | Kansas_City_Royals.png   |
| LAA    | W     | Los Angeles Angels   | Los_Angeles_Angels.png   |
| LAN    | W     | Los Angeles Dodgers  | Los_Angeles_Dodgers.png  |
| MIA    | E     | Miami Marlins        | Miami_Marlins.png        |
