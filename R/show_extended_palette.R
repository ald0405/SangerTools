#' Display Extended Brand Colour Palette
#' @return a Base R plot object
#' @importFrom scales show_col
#' @examples
#' library(scales)
#' library(SangerTools)
#' show_extended_palette()
#' @export
show_extended_palette <- function() {
  show_col(
    c(
      "#9880BB",
      "#0061BA",
      "#3BBCD9",
      "#223873",
      "#71B72B",
      "#D585BA",
      "#007761",
      "#4D8076",
      "#00C9A7",
      "#4A4453",
      "#C27767",
      "#D5CABD"
    )
  )

}


