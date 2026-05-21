#' @title
#' Vibrant branded discrete colour scale
#' @description
#' A `ggplot2` discrete fill scale built from the SangerTools brand palette.
#' Colours are drawn from NHS Identity guidelines with two modern accent
#' hues (lime and magenta) for energy, matched to [theme_sanger()].
#' @return A `ggplot2::scale_fill_manual` object.
#' @importFrom ggplot2 scale_fill_manual
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' library(ggplot2)
#' SangerTools::PopHealthData %>%
#'   filter(Smoker == 1) %>%
#'   categorical_col_chart(AgeBand) +
#'   labs(
#'     title = "Smoking population by age band",
#'     subtitle = "Most smokers are working aged",
#'     x = NULL,
#'     y = "Patients"
#'   ) +
#'   theme_sanger() +
#'   scale_fill_sanger()
#' @export
scale_fill_sanger <- function() {
  brand_colours <- c(
    "#003087", # NHS Dark Blue
    "#0072CE", # NHS Bright Blue
    "#41B6E6", # NHS Light Blue
    "#00A499", # NHS Aqua Green
    "#78BE20", # NHS Light Green
    "#FFB81C", # NHS Warm Yellow
    "#DA291C", # NHS Warm Red
    "#B4E55A", # Whoop-inspired lime accent
    "#D85DB1", # Vibrant magenta accent
    "#00A9CE", # NHS Aqua Blue
    "#425563", # NHS Dark Grey
    "#768692"  # NHS Mid Grey
  )
  scale_fill_manual(values = brand_colours)
}
