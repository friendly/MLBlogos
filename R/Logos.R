#' %% Logos for MLB teams in the 2021 season
#'
#' This data set contains the logos for the major leagues baseball teams in the 2021 season
#' along with information from the [Lahman::Teams()] data.
#'
#' Right to use these images for research, reference, and educational purposes is kindly provided by
#' Chris Creamer of www.sportslogos.net.
#'
#'
#' @name Logos
#' @docType data
#' @format A data frame with 30 observations on the following 5 variables.
#' \describe{
#'   \item{\code{teamID}}{team ID, a factor with levels \code{ARI} \code{ATL}
#' \code{BAL} \code{BOS} \code{CHA} \code{CHN} \code{CIN} \code{CLE} \code{COL}
#' \code{DET} \code{HOU} \code{KCA} \code{LAA} \code{LAN} \code{MIA} \code{MIL}
#' \code{MIN} \code{NYA} \code{NYN} \code{OAK} \code{PHI} \code{PIT} \code{SDN}
#' \code{SEA} \code{SFN} \code{SLN} \code{TBA} \code{TEX} \code{TOR}
#' \code{WAS}}
#'   \item{\code{divID}}{a factor with levels \code{C} \code{E} \code{W}}
#'   \item{\code{name}}{a character vector}
#'   \item{\code{png}}{name of the PNG logo image in the \code{png} directory, a character vector}
#'   \item{\code{img_src}}{URL of the GIF file from sportslogos.net, a character vector}
#'   }
#' @references %% ~~ possibly secondary sources and usages ~~
#' @source The GIF files were scraped from \url{https://www.sportslogos.net/}
#' @keywords datasets
#' @examples
#'
#' data(Logos)
#' ## maybe str(Logos) ; plot(Logos) ...
#'
NULL
