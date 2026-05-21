#' @title Core brand colour palette
#' @description
#' Displays the five core SangerTools brand colours drawn from NHS Identity
#' guidelines, alongside their hex codes.
#' @return A character vector of length 5 containing the hex codes for the
#'   core palette.
#' @importFrom scales show_col
#' @examples
#' library(SangerTools)
#' show_brand_palette()
#' @export
show_brand_palette <- function() {
  cols <- c(
    "#003087", # NHS Dark Blue
    "#0072CE", # NHS Bright Blue
    "#00A499", # NHS Aqua Green
    "#FFB81C", # NHS Warm Yellow
    "#DA291C"  # NHS Warm Red
  )
  show_col(cols, ncol = 5, borders = NA)
  invisible(cols)
}
