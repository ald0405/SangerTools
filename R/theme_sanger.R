#' Customised ggplot2 Theme
#' @return A customised ggplot2 plot
#' @importFrom ggthemes theme_fivethirtyeight
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

      #axis.text.x = element_blank(),

      #axis.ticks.x = element_blank(),

      #axis.ticks.x = element_line(color = "black",size = 3,lineend = "round",linetype = "dotted"),

      axis.line = element_line(size = 3, colour = "grey80"),

      axis.title = element_text(color = "#292929", face = "bold"),

      axis.text = element_text(color = "#292929", face = "bold")
    ) +
    scale_color_manual(values = c(
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
