#' Crude Prevalence Rate.
#' Calculate a group's Crude Prevalence Rate (Rate Per 1,000).
#' This is created to work with datasets that have 1 row per individual and Columns as variables.
#' This function utilises the Tidyverse framework of Non-Standard Evaluation.
#' As such arguments are passed to the function without quotation.
#' @param dataset_base_pop A dataframe containing 1 row per patient of an entire population
#' @param dataset_condition_pop A dataframe containing 1 row per patient of the population with a given condition
#' @param demographic This the grouping variable over which the rates with be calculated
#' @return a ggplot object
#' @importFrom dplyr left_join group_by summarise mutate arrange n
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' health_data <- SangerTools::PopHealthData
#' glimpse(health_data)
#' # Generate crude prevalene rate stats
#' crude_prevalence <- SangerTools::crude_pr(health_data, health_data %>%
#' dplyr::filter(Diabetes==1), Locality)
#' print(crude_prevalence)
#' @export
crude_pr <- function(dataset_base_pop,dataset_condition_pop,demographic){
  denominator <- {{dataset_base_pop}}  %>%
    group_by({{demographic}})  %>%
    summarise(demo_pop = n() )

  numerator <- {{dataset_condition_pop}}  %>%
    group_by({{demographic}})  %>%
    summarise(condition_pop = n() )


  final_df <- left_join(denominator, numerator)  %>%
    mutate(prevalance_1k = (condition_pop / demo_pop) * 1000) %>%
    arrange(desc(prevalance_1k))



  return(final_df)

}
