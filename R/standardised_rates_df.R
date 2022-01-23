#' Standardised Prevalence Rates in Tibble format.
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData.
#' @param Split_by A column name within df for which the standardised rates will be calculated for.
#' @param Condition A Health condition flag denoted by 1 & 0; where 1 denotes the patient being positive for the health condition.
#' @param Population_Standard Population Standard Weight used for Standardising; default set to NULL; which denotes  use of Age Structure of df.
#' @param ... Variables used to standardise by; Must always have Ageband, additional variables are optional and should be passed separated by commas.
#' @return A tibble containing Standardised Prevalence Rates by specified group.
#' @importFrom dplyr ungroup count summarise group_by n mutate left_join pull rename filter enquos
#' @examples
#' library(SangerTools)
#' df_rates <- standardised_rates_df(
#'   df = PopHealthData,
#'   Split_by = Locality,
#'   Condition = Diabetes,
#'   Population_Standard = NULL,
#'   AgeBand
#' )
#' print(df_rates)
#' @export
#'
standardised_rates_df <- function(df, Split_by, Condition, Population_Standard, ...) {
  # Non-Standard Evaluation
  group_var <- enquos(...)

  # Standard Population
  if (is.null(Population_Standard)) {
    pop_standard <- df %>%
      group_by(!!!group_var) %>%
      count(name = "Pop_Weight")

    overall_pop_sum <- pop_standard %>%
      ungroup() %>%
      summarise(total_pop = sum(Pop_Weight, na.rm = TRUE))
  } else {
    pop_standard <- Population_Standard %>%
      group_by(!!!group_var) %>%
      count(name = "Pop_Weight")

    overall_pop_sum <- pop_standard %>%
      ungroup() %>%
      summarise(total_pop = sum(Pop_Weight, na.rm = TRUE))
  }

  # Base Population Size
  denominator <- df %>%
    group_by({{ Split_by }}, !!!group_var) %>%
    count(name = "Population") %>%
    arrange({{ Split_by }})
  # Condition Population Size
  numerator <- df %>%
    filter({{ Condition }} == 1) %>%
    group_by({{ Split_by }}, !!!group_var) %>%
    count(name = "Positive_Pop") %>%
    arrange({{ Split_by }})

  # Crude Rates & Standardised Rates Calculation
  output <- left_join(denominator, numerator) %>%
    left_join(pop_standard) %>%
    mutate(Crude_Rate = Positive_Pop / Population) %>%
    mutate(Expected_Cohort_Size = Crude_Rate * Pop_Weight) %>%
    group_by({{ Split_by }}) %>%
    summarise(Standardised_Rate_1k = (sum(Expected_Cohort_Size, na.rm = TRUE) / overall_pop_sum * 1000)) %>%
    arrange(desc(Standardised_Rate_1k))


  return(output)
}
