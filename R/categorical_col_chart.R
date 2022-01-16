#' Plot Counts of Categorical Variables
#' Create a ggplot2 column chart of categorical variables with proportions, in ascending order.
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
#' @importFrom ggthemes scale_fill_economist
#' @importFrom magrittr %>%
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' library(ggplot2)
#' # Group by Age Band
#' health_data <- SangerTools::PopHealthData
#' health_data %>%
#'   dplyr::filter(Smoker == 1) %>%
#'   SangerTools::categorical_col_chart(AgeBand) + labs(x = "Ethnicity", y = "Patient Number")
#' @export

categorical_col_chart <- function(df, grouping_var) {
  p1 <- {{ df }} %>%
    dplyr::group_by({{ grouping_var }}) %>%
    dplyr::summarise(patients_n = n()) %>%
    dplyr::mutate(proportion = patients_n / sum(patients_n)) %>%
    ggplot(aes(reorder({{ grouping_var }}, patients_n), patients_n, fill = {{ grouping_var }})) +
    geom_col(show.legend = FALSE) +
    geom_label(aes(label = paste0(round((proportion * 100), 2), "%"), size = 12),
      show.legend = FALSE, nudge_y = -0.2
    ) +
    ggthemes::scale_fill_economist() +
    scale_y_continuous(labels = comma)
  return(p1)
}
