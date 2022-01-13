#' Crude Prevalence Calculator
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData
#' @param Condition A Health condition flag denoted by 1 & 0
#' @param ... Grouping variables ie Locality; use at least 1, when multiple seperate by comma
#' @return a tibble Rates Per 1,000 calculated
#' @importFrom dplyr left_join group_by summarise mutate arrange n
#' @importFrom magrittr %>%
#' @importFrom rlang :=
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' health_data <- SangerTools::PopHealthData
#' glimpse(health_data)
#' # Generate crude prevalene rate stats
#' crude_prevalence <- SangerTools::crude_rates(health_data,Diabetes,Locality)
#' print(crude_prevalence)
#' @export

crude_rates <- function (df,Condition,...) {

  group_var <- enquos(...)

denominator <- df %>%
    group_by(!!!group_var) %>%
    summarise(Cohort_Size = n(), .groups = "drop")



  numerator <- df %>%
       group_by(!!!group_var) %>%
       filter({{Condition}} == 1) %>%
    summarise(condition_pop := n(), .groups = "drop")



  final_df <- left_join(denominator, numerator) %>%
    mutate(Prevalence_1k = (condition_pop / Cohort_Size) * 1000) %>%
    arrange(desc(Prevalence_1k)) %>%
    rename("{{Condition}}_Population" := condition_pop)

    return(final_df)

}

