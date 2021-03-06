% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hj_scales.R
\name{scale_fill_hj}
\alias{scale_fill_hj}
\title{Fill scale constructor for HJ colors}
\usage{
scale_fill_hj(palette = "main", discrete = TRUE, reverse = FALSE, ...)
}
\arguments{
\item{palette}{Character name of a palette}

\item{discrete}{Boolean indicating whether color aesthetic is discrete or not}

\item{reverse}{Boolean indicating whether the palette should be reversed}

\item{...}{Additional arguments passed to discrete_scale() or scale_color_gradientn()}
}
\description{
Fill scale constructor for HJ colors
}
\examples{
 df <- data.frame(
   c1 = rep(c("a","b"),3),
   c2 = rep(c("c","d","e"), each = 2),
   x = runif(6)
 )

 library(ggplot2)
 # plot with discrete color scale
 ggplot(df) +
   geom_bar(aes(c1, x, fill = c2), stat = "identity") +
   scale_fill_hj()

}
\seealso{
\code{\link{scale_color_hj}}
}
