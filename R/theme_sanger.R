#' @title
#' Customised ggplot2 Theme
#' @description
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
#' categorical_col_chart(SangerTools::PopHealthData, Locality) +
#'   theme_sanger()+
#'   labs(title = "Categorical Column Chart",
#'   x = "Locality",
#'   y = "Number of Patients")+
#'   scale_fill_sanger()
#' @export
theme_sanger <- function() {
  theme_fivethirtyeight() +
    theme(
      text = element_text(),
      panel.background = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_blank(),
      plot.background = element_rect("#e8f4f8"),
      plot.title = element_markdown(color = "#0061BA"),
      plot.subtitle = element_markdown(color = "#292929", face = "italic"),
      plot.caption = element_markdown(color = "#292929", face = "bold"),
      strip.text.x = element_text(colour = "white", face = "bold"),
      strip.background = element_rect(fill = "darkgrey"),
      axis.line = element_blank(),
      axis.title = element_text(color = "#0061BA", face = "bold",size = 18),
      axis.text = element_text(color = "#292929", face = "bold")
    )
}
