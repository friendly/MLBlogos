#' @importFrom utils data
.get.logos <- function(){
  .env <- new.env()
  data(Logos, package = 'MLBlogos', envir = .env)
  .env$Logos
}


#' Get logo information for a teams
#'
#' @param teams A character vector of one or more `TeamID`s
#' @return      A data.frame with columns `teamID`, `name`, `png`
#' @export
#' # @importFrom dplyr filter select
#' # @importFrom utils globalVariables
#'
#' @examples
#' logoInfo(c("TOR", "TEX"))
#'
logoInfo <- function(teams) {
  Logos <- .get.logos()
  # utils::globalVariables(c("teamID", "name", "png"), add=FALSE)
  # info <- Logos |>
  #   dplyr::filter(teamID %in% teams) |>
  #   dplyr::select(teamID, name, png)
  info <- Logos["teamID" %in% teams, ]
  info <- info[, c("teamID", "name", "png")]
  info
}

#' Get logo images for teams
#'
#' @param teams A character vector of one or more `TeamID`s
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
