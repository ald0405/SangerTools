#' @title
#' Branded discrete colour scale
#' @description
#' This anonymous function allows you to apply the Sanger Theme colours to your ggplot2 plot
#' @return A custom colour filled ggplot2 plot
#' @importFrom ggplot2 scale_fill_manual
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' library(ggplot2)
#' # Group by Age Band
#' health_data <- SangerTools::PopHealthData
#' health_data %>%
#'   dplyr::filter(Smoker == 1) %>%
#'   SangerTools::categorical_col_chart(AgeBand) +
#'   labs(
#'     title = "Smoking Population by Age Band",
#'     subtitle = "Majority of Smokers are Working Aged ",
#'     x = NULL,
#'     y = "Patient Number"
#'   )+
#'   scale_fill_sanger()
#' @export

scale_fill_sanger <- function(){
  brand_colours <- c("#9880BB","#0061BA","#3BBCD9","#223873","#71B72B","#D585BA",
                    "#007761","#4D8076", "#00C9A7", "#4A4453","#C27767","#D5CABD")
  scale_fill_manual(values = brand_colours)
}
