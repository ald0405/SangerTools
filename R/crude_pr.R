#' Crude Prevalence Rate
#' @description Calculate a group's Crude Prevalence Rate (Rate Per 1,000).
#'  This is created to work with datasets that have 1 row per individual
#'              and Columns as variables.
#'              This function utilises the Tidyverse framework of Non-Standard Evaluation.
#'              As such arguments are passed to the function without quotation.
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom dplyr mutate
#' @importFrom dplyr left_join
#' @importFrom dplyr desc
#' @importFrom dplyr arrange
#' @importFrom magrittr %>%
#' @param dataset_base_pop A dataframe containing 1 row per patient of an entire population
#' @param dataset_condition_pop A dataframe containing 1 row per patient of the
#'                              population with a given condition
#'                              If your dataframe has both the entire population
#'                              and those with a condition, consider creating
#'                              dataset_condition_pop by
#'                              `dataset_condition_pop <- dataset_base_pop %>% filter(Condition == "Yes")`
#' @param demographic This the grouping variable over which the rates with be calculated
#'
#' @return
#' @export
#'
#' @examples
#'          crudepr(dataset_base_pop,dataset_condition_pop,Ethnicity)
crude_pr <- function(dataset_base_pop,dataset_condition_pop,demographic){

  denominator <- {{dataset_base_pop}}  %>%

    group_by({{demographic}})  %>%

    summarise(demo_pop = n() )


  numerator <- {{dataset_condition_pop}}  %>%

    group_by({{demographic}})  %>%

    summarise(condition_pop = n() )



  df3 <- left_join(denominator, numerator)  %>%

    mutate(prevalance_1k = (condition_pop / demo_pop) * 1000) %>%

    arrange(desc(prevalance_1k))



  return(df3)

}
