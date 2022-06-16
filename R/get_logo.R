#' Get logo information for a teams
#'
#' @param teams a character vector of one or more `TeamID`s
#' @return A data.frame with columns `teamID`, `name`, `png`
#' @export
#' @importFrom dplyr filter select
#'
#' @examples
#' logoInfo(c("TOR", "TEX"))
#'
logoInfo <- function(teams) {
  info <- Logos |>
    dplyr::filter(teamID %in% teams) |>
    dplyr::select(teamID, name, png)
  info
}

#' Get logo images for teams
#'
#' @param teams
#'
#' @return the image files for the teams
#' @importFrom magick image_read
#' @export
#'
#' @examples
#' toronto <- get_logo("TOR")
#' plot(toronto)
#'
get_logo <- function(teams) {
  images <- logoInfo(teams)
  if (nrow(images) == 0) stop("No teamIDs found")
  png <- images[,"png"]
  dir <- system.file("png/", package = "MLBlogos")
  magick::image_read(file.path(dir, png))
}
