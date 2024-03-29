#' ggplot2 theme for simple, functional and beautiful graphs.
#'
#' @param legend_right Logical indicating whether legend should be placed to
#' the right of the plot. If FALSE, the default, legend is positioned above the
#' plot. The caption will change position relative to where the legend is
#' positioned.
#' @param base_size The base font size
#' @param base_family Font family
#' @param base_line_size Default
#' @param base_rect_size Default
#'
#' @importFrom ggplot2 %+replace%
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(displ, hwy, colour = class)) +
#'   geom_point() +
#'   hj_theme()
#'
#' ggplot(mpg, aes(displ, hwy)) +
#'   geom_point() +
#'   facet_wrap(vars(class)) +
#'   hj_theme()
#'
hj_theme <- function(legend_right = FALSE,
                     base_size = 12,
                     base_family = "",
                     base_line_size = base_size / 170,
                     base_rect_size = base_size / 170) {

  half_line <- base_size/2
  grid_line_colour <- hj_cols("black-20")
  grid_line_size <- 0.2
  title_text_colour <- hj_cols("black")
  other_text_colour <- hj_cols("black-70")

  if(legend_right == TRUE){
    spec_legend_position <- "right"
    spec_legend_direction <- "vertical"
    legend_justification_spec <- "center"
    legend_box_spacing_spec = ggplot2::unit(2 * half_line, "pt")
  } else {
    spec_legend_position <- "bottom"
    spec_legend_direction <- "horizontal"
    legend_justification_spec <- c(0,0)
    legend_box_spacing_spec <- ggplot2::unit(0, "char")
  }

  ggplot2::theme_minimal(base_size = base_size,
                         base_family = base_family,
                         base_line_size = base_line_size) %+replace%

    ggplot2::theme(
      plot.title = ggplot2::element_text(
        colour = title_text_colour,
        size = ggplot2::rel(1.6),
        face = "bold",
        hjust = 0.5,
        margin = ggplot2::margin(b = half_line)
      ),

      plot.subtitle = ggplot2::element_text(
        colour = other_text_colour,
        size = ggplot2::rel(1.2),
        face = "bold",
        hjust = 0.5,
        margin = ggplot2::margin(b = half_line)
      ),

      plot.caption = ggplot2::element_text(
        colour = other_text_colour,
        size = ggplot2::rel(0.8),
        hjust = if (legend_right == TRUE) {0} else {1},
        margin = margin(t = half_line)
      ),

      axis.title = ggplot2::element_text(
        colour = other_text_colour,
        size = ggplot2::rel(0.9),
        face = "bold"
      ),

      axis.text = ggplot2::element_text(
        colour = other_text_colour,
        size = ggplot2::rel(0.8),
        margin = ggplot2::margin()
      ),

      axis.text.y = ggplot2::element_text(margin = ggplot2::margin(r = -0.8 * half_line / 2), hjust = 1),
      axis.line = ggplot2::element_line(
        colour = grid_line_colour,
        size = grid_line_size
      ),

      axis.line.y = ggplot2::element_line(color="black", size = 0.7),
      axis.ticks = ggplot2::element_line(
        colour = grid_line_colour,
        size = grid_line_size
      ),
      
      axis.line.x = ggplot2::element_line(
        colour = "black", size = 0.7
      ),

      axis.ticks.y = ggplot2::element_blank(),
      axis.ticks.length = ggplot2::unit(0.5,"char"),
      panel.grid.major.y = ggplot2::element_line(
        colour = grid_line_colour,
        size = grid_line_size
      ),

      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      legend.position = spec_legend_position,
      legend.justification = legend_justification_spec,
      legend.direction = spec_legend_direction,
      legend.title = ggplot2::element_text(hjust = 0,
                                           colour = other_text_colour,
                                           size = ggplot2::rel(0.9),
                                           face = "bold"),
      legend.spacing.x = ggplot2::unit(1, "char"),
      legend.text = ggplot2::element_text(
        colour = other_text_colour,
        hjust = 0,
        size = ggplot2::rel(0.8)
      ),

      legend.margin = ggplot2::margin(),
      legend.box.spacing = legend_box_spacing_spec,
      plot.margin = ggplot2::margin(1,1,1,1, unit = "char"),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      
      complete = TRUE

    )
}
