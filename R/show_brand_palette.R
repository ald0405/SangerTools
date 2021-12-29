#' Display Brand Colour Palette
#' Displays a brand colour palette for showing the hex codes associated with brand
#' @return a Base R plot object
#' @importFrom scales show_col
#' @examples
#' library(scales)
#' library(SangerTools)
#' show_brand_palette()
#' @export
show_brand_palette <- function() {
  show_col(c("#9880BB",
             "#0061BA",
             "#3BBCD9",
             "#223873",
             "#71B72B"
             )
           )
}
