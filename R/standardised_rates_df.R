#' Standardised Prevalence Rates in Tibble format.
#' @description
#' standardised_rates_df() performs the same calculation as standardised_rates();
#' however rather than explicitly selecting two groups, this calculation is performed
#' for all unique values in the column passed to `split_by`. This is a more generalised function
#' and will pair well with `excel_clip()` and `df_to_sql()`.
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData.
#' @param Split_by A column name within df for which the standardised rates will be calculated for.
#' @param Condition A Health condition flag denoted by 1 & 0; where 1 denotes the patient being positive for the health condition.
#' @param Population_Standard Population Standard Weight used for Standardising; default set to NULL; which denotes  use of Age Structure of df.
#' @param Granular Takes a boolean value. If set to TRUE will output a tibble with Standardised Rates using values provided in `Split_col` and `...`
#' By default is set to FALSE.
#' @param ... Variables used to standardise by; Must always have Age band for age standardisation, additional variables are optional and should be passed separated by commas.
#' @return A tibble containing standardised Prevalence Rates by specified group.
#' @importFrom dplyr ungroup count summarise group_by n mutate left_join pull rename filter enquos pull
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
#'
#' # If using user defined population Structure
#' library(SangerTools)

#' user_standard_pop <- PopHealthData %>%
#'  group_by(AgeBand) %>%
#'  count("Pop Weight")
#'
#'df_rates2 <- standardised_rates_df(
#'   df = PopHealthData,
#'   Split_by = Locality,
#'   Condition = Diabetes,
#'   Population_Standard = user_standard_pop,
#'   Granular = TRUE,
#'   AgeBand
#'   )
#'print(df_rates2)
#' @export
#'
standardised_rates_df <- function(df, Split_by, Condition, Population_Standard,Granular = FALSE, ...) {

  # Non-Standard Evaluation

  group_var <- enquos(...)

  # Standard Population

  if (is.null(Population_Standard)) {

    pop_standard <- df %>%
      group_by(!!!group_var) %>%
      count(name = "Pop_Weight")



    overall_pop_sum <- pop_standard %>%
      ungroup() %>%
      summarise(total_pop = sum(Pop_Weight, na.rm = TRUE)) %>%
      pull()

  } else {

    pop_standard <- Population_Standard %>%
      group_by(!!!group_var) %>%
      count(name = "Pop_Weight")



    overall_pop_sum <- pop_standard %>%
      ungroup() %>%
      summarise(total_pop = sum(Pop_Weight, na.rm = TRUE)) %>%
      pull()

  }



  # Base Population Size

  denominator <- df %>%
    group_by({{ Split_by }}, !!!group_var) %>%
    count(name = "Population") %>%
    arrange({{ Split_by }})

  # Condition Population Size

  numerator <- df %>%
    filter({{ Condition }} == 1) %>%
    group_by({{ Split_by }},!!!group_var) %>%
    count(name = "Positive_Pop") %>%
    arrange({{ Split_by }})



  # Crude Rates & Standardised Rates Calculation



  if(Granular == FALSE){

  # By Split_by

  output <- left_join(denominator, numerator) %>%
    left_join(pop_standard) %>%
    mutate(Crude_Rate = Positive_Pop / Population) %>%
    mutate(Expected_Cohort_Size = Crude_Rate * Pop_Weight) %>%
    group_by({{ Split_by }}) %>%
    summarise(Standardised_Rate_1k = (sum(Expected_Cohort_Size, na.rm = TRUE) / overall_pop_sum * 1000),.groups = "drop") %>%
    arrange(desc(Standardised_Rate_1k))

    return(output)

  } else {


  # By Split_by & ...
  output_granular <- left_join(denominator, numerator) %>%
    left_join(pop_standard) %>%
    mutate(Crude_Rate = Positive_Pop / Population) %>%
    mutate(Expected_Cohort_Size = Crude_Rate * Pop_Weight) %>%
    group_by({{ Split_by }},!!!group_var) %>%
    summarise(Standardised_Rate_1k = (sum(Expected_Cohort_Size, na.rm = TRUE) / overall_pop_sum * 1000),.groups = "drop") %>%
    arrange(desc(Standardised_Rate_1k))



  return(output_granular)

  }

}
