#' @title Extended brand colour palette
#' @description
#' Displays the full 12-colour SangerTools brand palette used by
#' [scale_fill_sanger()]. Mixes NHS Identity colours with two modern accent
#' hues (lime, magenta) for charts that need more separation.
#' @return A character vector of length 12 containing the hex codes for the
#'   extended palette.
#' @importFrom scales show_col
#' @examples
#' library(SangerTools)
#' show_extended_palette()
#' @export
show_extended_palette <- function() {
  cols <- c(
    "#003087", "#0072CE", "#41B6E6", "#00A499",
    "#78BE20", "#FFB81C", "#DA291C", "#B4E55A",
    "#D85DB1", "#00A9CE", "#425563", "#768692"
  )
  show_col(cols, ncol = 6, borders = NA)
  invisible(cols)
}
