#' Customised ggplot2 Theme
#' A customised ggplot2 theme for the SangerTools package
#' @return A customised ggplot2 plot
#' @importFrom ggthemes theme_fivethirtyeight
#' @importFrom ggplot2 element_blank element_rect
#' @importFrom ggplot2 element_text element_line theme
#' @importFrom ggtext element_markdown
#' @examples
#' library(SangerTools)
#' library(ggthemes)
#' library(ggplot2)
#' library(ggtext)
#' categorical_col_chart(SangerTools::PopHealthData,Locality) +
#' theme_sanger()
#' @export
theme_sanger <- function() {
  theme_fivethirtyeight() +
    theme(
      text = element_text(),
      panel.background = element_blank(),
      panel.grid.minor = element_blank(),
      plot.background = element_rect("#EBEBEB"),
      plot.title = element_markdown(color = "#0061BA"),
      plot.subtitle = element_markdown(color = "#292929", face = "italic"),
      plot.caption = element_markdown(color = "#292929", face = "bold"),
      strip.text.x = element_text(colour = "white", face = "bold"),
      axis.line = element_line(size = 3, colour = "grey80"),
      axis.title = element_text(color = "#292929", face = "bold"),
      axis.text = element_text(color = "#292929", face = "bold")
  )

}
