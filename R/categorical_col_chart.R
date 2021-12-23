#'  Plot Counts of Categorical Variables
#' @description Create a ggplot2 column chart of categorical variables with
#'              proportions, in ascending order
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_col
#' @importFrom ggplot2 geom_label
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 scale_y_continuous
#' @importFrom scales comma
#' @importFrom ggthemes scale_fill_economist
#' @param df A dataframe with categorical variables
#' @param grouping_var a categorical variable by which to group the count by
#'
#' @return
#' @export
#'
#' @examples
#'         categorical_col_chart(gapminder,Continent)
categorical_col_chart <- function(df, grouping_var){

  p1 <- {{df}}  %>%

    group_by( {{grouping_var}} )  %>%


    summarise(patients_n = n()) %>%

    mutate(proportion = patients_n/sum(patients_n))  %>%


    ggplot(aes(reorder( {{grouping_var}}, patients_n),patients_n, fill = {{grouping_var}} ))+

    geom_col(show.legend = FALSE)+

    geom_label(aes(label = paste0(round((proportion*100),2),"%"),size = 12),

               show.legend = FALSE,nudge_y = -0.2)+

    scale_fill_economist()+

    scale_y_continuous(labels = comma)

  return(p1)

}