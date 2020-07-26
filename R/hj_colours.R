hj_colours <- c(
  black = "#000000",
  white = "#FFFFFF",
  rust = "#B8390B",
  russet = "#804126",
  sweet_brown = "#B03838",
  tart_orange = "#FC3232",
  ruby_red = "#A11616",
  max_red = "#D92525",
  purple = "#110129",
  slate = "#262A33",
  russian_violet = "#1A0D40",
  forest = "#3A8C30",

  burnt_siena = "#D97B59",

  claret = "#990F3D",
  oxford = "#0F5499",
  teal = "#0D7680",
  wheat = "#F2DFCE",
  sky = "#CCE6FF",
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

#' HJ Colours Function to Select Colour from Palette
#'
#' Get hex codes for plot colours.
#'
#' @param ... Names of the colours
#'
#' @details Use \code{hj_cols()} to see the full list of colours.
#' @examples
#' # Full list
#' hj_cols()
#'
#' # Choose colours
#' hj_cols("paper")
#' hj_cols("oxford", "claret")
#'
#' @export
hj_cols <- function(...){
  cols <- c(...)

  if(is.null(cols)){
    return(hj_colours)
  }

  not_found <- which(!(cols %in%  names(hj_colours)))
  if(length(not_found) > 0){
    warning(paste0("Could not find colours ",
                   paste0(cols[not_found], collapse = ", "),
                   ". Returned NAs instead.\n"))
  }

  unname(hj_colours[cols])
}

# HJ Palettes
hj_palettes <- list(
  `main` = hj_cols("rust", "purple", "burnt_siena", "slate"),
  `reds` = hj_cols("rust", "russet", "sweet_brown", "tart_orange", "ruby_red", "max_red"),
  `black` = hj_cols("black-5","black-10","black-20","black-30","black-40","black-50","black-60","black-70","black-80","black-90"),
  `white` = hj_cols("white-10","white-20","white-40","white-60","white-80")
  )


#' HJ Colour Palettes Generator.
#'
#' Returns a function that can interplotate between colors in a palette.
#'
#' @param palette Character name of a palette
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
hj_pal <- function(palette = "main", reverse = FALSE, ...){

  assertthat::assert_that(palette %in% names(hj_palettes),
                          msg = paste0("Palette not found. Please use one of: ", paste0(names(hj_palettes), collapse = ", ")))

  pal <- hj_palettes[[palette]]

  if(reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
}
