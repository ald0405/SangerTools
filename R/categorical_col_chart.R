#' @title  Plot Counts of Categorical Variables
#' @description
#' Create a ggplot2 column chart of categorical variables with labels, in ascending order.
#' The plot will be customised using the provided theme \code{\link{theme_sanger}}, y-axis labels will have a comma for every third integer value.
#' If the column provided to `grouping_var` has more than approximately 5 values, you may need to consider
#' rotating x axis labels using \code{\link[ggplot2]{theme}}
#'
#' A comprehensive explanation of ggplot2 customisation is available \href{https://ggplot2.tidyverse.org/reference/}{here}
#' @param df A dataframe with categorical variables
#' @param grouping_var a categorical variable by which to group the count by
#' @return a ggplot2 object
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_col
#' @importFrom ggplot2 geom_label
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 scale_y_continuous
#' @importFrom stats reorder
#' @importFrom scales comma
#' @importFrom magrittr %>%
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
#'   )
#' @export

categorical_col_chart <- function(df, grouping_var) {
  p1 <- df %>%
    dplyr::group_by({{ grouping_var }}) %>%
    dplyr::summarise(patients_n = n()) %>%
    dplyr::mutate(proportion = patients_n / sum(patients_n)) %>%
    ggplot(aes(reorder({{ grouping_var }}, patients_n), patients_n, fill = {{ grouping_var }})) +
    geom_col(show.legend = FALSE, alpha = 0.7) +
    geom_label(aes(label = paste0(round((proportion * 100), 2), "%"), size = 12),
      show.legend = FALSE, nudge_y = -0.2
    ) +
    scale_y_continuous(labels = comma) +
    theme_sanger()
  return(p1)
}
