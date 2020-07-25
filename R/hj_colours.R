hj_o_colours <- c(
  paper = "#FFF1E5",
  black = "#000000",
  white = "#FFFFFF",
  claret = "#990F3D",
  oxford = "#0F5499",
  teal = "#0D7680",
  wheat = "#F2DFCE",
  sky = "#CCE6FF",
  slate = "#262A33",
  velvet = "#593380",
  mandarin = "#FF8833",
  lemon = "#FFEC1A",
  jade = "#00994D",
  wasabi = "#96CC28",
  crimson = "#CC0000",
  candy = "#FF7FAA",
  `black-5` = "#F2E5DA",
  `black-10` = "#E6D9CE",
  `black-20` = "#CCC1B7",
  `black-30` = "#B3A9A0",
  `black-40` = "#999189",
  `black-50` = "#807973",
  `black-60` = "#66605C",
  `black-70` = "#4D4845",
  `black-80` = "#33302E",
  `black-90` = "#1A1817",
  `white-10` = "#FFF2E8",
  `white-20` = "#FFF4EA",
  `white-40` = "#FFF7EF",
  `white-60` = "#FFF9F5",
  `white-80` = "#FFFCFA",
  `claret-30` = "#4D081F",
  `claret-40` = "#660A29",
  `claret-50` = "#800D33",
  `claret-60` = "#990F3D",
  `claret-70` = "#B31247",
  `claret-80` = "#CC1452",
  `claret-90` = "#E6175C",
  `claret-100` = "#FF1A66",
  `oxford-30` = "#082A4D",
  `oxford-40` = "#0A3866",
  `oxford-50` = "#0D4680",
  `oxford-60` = "#0F5499",
  `oxford-70` = "#1262B3",
  `oxford-80` = "#1470CC",
  `oxford-90` = "#177EE6",
  `oxford-100` = "#1A8CFF",
  `teal-20` = "#052F33",
  `teal-30` = "#08474D",
  `teal-40` = "#0A5E66",
  `teal-50` = "#0D7680",
  `teal-60` = "#0F8E99",
  `teal-70` = "#12A5B3",
  `teal-80` = "#14BDCC",
  `teal-90` = "#17D4E6",
  `teal-100` = "#1AECFF"
)

#' HJ Colours
#'
#' Get hex codes for plot colours.
#'
#' @param ... Names of the colours
#'
#' @details Use \code{hj_colours()} to see the full list of colours. This list
#'   comes from
#'   \href{https://registry.origami.ft.com/components/o-colors}{Origami
#'   o-colors}.
#' @examples
#' # Full list
#' hj_colours()
#'
#' # Choose colours
#' hj_colours("paper")
#' hj_colours("oxford", "claret")
#'
#' @export
hj_colours <- function(...){
  cols <- c(...)

  if(is.null(cols)){
    return(hj_o_colours)
  }

  not_found <- which(!(cols %in%  names(hj_o_colours)))
  if(length(not_found) > 0){
    warning(paste0("Could not find colours ",
                   paste0(cols[not_found], collapse = ", "),
                   ". Returned NAs instead.\n"))
  }

  unname(hj_o_colours[cols])
}
