#' @importFrom utils data
.get.logos <- function(){
  .env <- new.env()
  data(Logos, package = 'MLBlogos', envir = .env)
  .env$Logos
}


#' Get logo information for one or more teams
#'
#' This uses the `Logos` data set in the package to select the rows corresponding
#' to the `teams` argument.
#'
#' In the result, `img` is the internal filename of the PNG file in the package, in the `inst/pkg`
#' directory. `image` is the full path to that image in the installed package, which is most
#' useful in applications.
#'
#' @param teams A character vector of one or more `TeamID`s. If missing, all teams are returned.
#'              Values of `teams` that do not appear in `Logos` are silently ignored in
#'              this version.
#' @return      A data.frame with columns `teamID`, `name`, `img` and `image` and rows matching
#'              the `teams`.
#' @export
#'
#' @examples
#' logoInfo(c("TOR", "TEX"))
#'
#' # get the file path to the Toronto Blue Jays logo
#' toronto <- logoInfo("TOR")[, "image"]
#' toronto
#'
logoInfo <- function(teams) {
  Logos <- .get.logos()
  # dplyr doesn't work here in R CMD check - variables considered global
  # utils::globalVariables(c("teamID", "name", "png"), add=FALSE)
  # info <- Logos |>
  #   dplyr::filter(teamID %in% teams) |>
  #   dplyr::select(teamID, name, png)
  info <- if(!missing(teams)) {
    wanted <- which(Logos$teamID %in% teams)
    Logos[wanted, ]
  }
  else
    Logos

  info <- info[, c("teamID", "name", "img")]
  # find the corresponding image files in the package
  dir <- system.file("png/", package = "MLBlogos")
  info$image <- file.path(dir, info[, "img"])
  info
}

#' #' Get logo images for teams
#' #'
#' #' @param teams A character vector of one or more `TeamID`s
#' #'
#' #' @return the image files for the teams
#' #' @importFrom magick image_read
#' #' @export
#' #'
#' #' @examples
#' #' toronto <- get_logo("TOR")
#' #' plot(toronto)
#' #'
#' get_logo <- function(teams) {
#'   images <- logoInfo(teams)
#' #  if (nrow(images) == 0) stop("No teamIDs found")
#'   png <- images[,"png"]
#'   dir <- system.file("png/", package = "MLBlogos")
#'   magick::image_read(file.path(dir, png))
#' }
