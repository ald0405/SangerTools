#' Crude Prevalence Calculator
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData
#' @param Condition A Health condition flag denoted by 1 & 0; where 1 denotes the patient being positive for the health condition
#' @param ... Variables used to standardise by; Must always have Ageband, additional variables are optional
#' @return a tibble with Crude Prevalence Rates(Rate per 1,000) for each value included in ...
#' @importFrom dplyr left_join group_by summarise mutate arrange n
#' @importFrom magrittr %>%
#' @importFrom rlang :=
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' health_data <- SangerTools::PopHealthData
#' glimpse(health_data)
#' # Generate crude prevalene rate stats
#' crude_prevalence <- SangerTools::crude_rates(health_data, Diabetes, Locality)
#' print(crude_prevalence)
#' @export

crude_rates <- function(df, Condition, ...) {

  if (is_tibble(df) == FALSE | is.data.frame(df) == FALSE) {
    stop("Check Input df: Non Tibble or DataFrame Object Detected")
  } else {

    group_var <- enquos(...)

    denominator <- df %>%
      group_by(!!!group_var) %>%
      summarise(Cohort_Size = n(), .groups = "drop")



    numerator <- df %>%
      group_by(!!!group_var) %>%
      filter({{ Condition }} == 1) %>%
      summarise(condition_pop := n(), .groups = "drop")



    final_df <- left_join(denominator, numerator) %>%
      mutate(Prevalence_1k = (condition_pop / Cohort_Size) * 1000) %>%
      arrange(desc(Prevalence_1k)) %>%
      rename("{{Condition}}_Population" := condition_pop)

  return(final_df)
  }
}
