#' Direct Standardised Prevalence Rates
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData.
#' @param Geography Column name using NSE;passed without quotation denoting column where @param LocalityA and @param LocalityB are contained.
#' @param LocalityA A value within @param Geography using SE; must be passed within quotation.
#' @param LocalityB A value within @param Geography using SE; must be passed within quotation.
#' @param Condition A Health condition flag denoted by 1 & 0; where 1 denotes the patient being positive for the health condition.
#' @param Population_Standard Population Standard Weight used for Standardising; default set to NULL; which denotes  use of Age Structure of @param  df .
#' @param Verbose Takes a boolean value to determine function output printing. TRUE will print two dataframes however they will be different to the the output of the function.
#' @param ... Variables used to standardise by; Must always have Ageband, additional variables are optional and should be passed separated by commas.
#' @return List of length 2 containing 2 tibbles with standardised rates for @param LocalityA and @param LocalityB .
#' @importFrom dplyr ungroup count summarise group_by n mutate left_join pull rename filter enquos
#' @importFrom janitor clean_names
#' @importFrom magrittr %>%
#' @importFrom rlang :=
#' @export
standardised_rates <- function(df, Geography, LocalityA, LocalityB, Condition, Population_Standard = NULL, Verbose = TRUE, ...) {
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

  # For Population A --------------------------------------------------------



  # Population in Locality

  denominator_a <- df %>%
    filter({{ Geography }} == LocalityA) %>%
    group_by(!!!group_var) %>%
    summarise(LocalityA_pop = n(), .groups = "drop")



  # Population in Locality with Condition

  numerator_a <- df %>%
    filter({{ Geography }} == LocalityA) %>%
    filter({{ Condition }} == 1) %>%
    group_by(!!!group_var) %>%
    summarise(conditionA_pop = n(), .groups = "drop")



  # Crude Prevalence

  final_a <- left_join(denominator_a, numerator_a) %>%
    mutate(crude_rate = conditionA_pop / LocalityA_pop) %>%
    mutate(crude_prevalence = (conditionA_pop / LocalityA_pop) * 1000) %>%
    # Age Standardised

    left_join(pop_standard) %>%
    mutate(Expected_Cohort_Size = crude_rate * Pop_Weight) %>%
    rename(
      "{{LocalityA}}_Pop" := LocalityA_pop,
      "{{Condition}}_Pop" := conditionA_pop
    )





  standard_rate_a <- left_join(denominator_a, numerator_a) %>%
    mutate(crude_rate = conditionA_pop / LocalityA_pop) %>%
    left_join(pop_standard) %>%
    mutate(Expected_Cohort_Size = crude_rate * Pop_Weight) %>%
    summarise((sum(Expected_Cohort_Size, na.rm = TRUE) / overall_pop_sum) * 1000, .groups = "drop") %>%
    pull()



  # For Population B --------------------------------------------------------

  # Population in Locality B

  denominator_b <- df %>%
    filter({{ Geography }} == LocalityB) %>%
    group_by(!!!group_var) %>%
    summarise(LocalityB_pop = n(), .groups = "drop")

  # Population in Locality with Condition

  numerator_b <- df %>%
    filter({{ Geography }} == LocalityB) %>%
    filter({{ Condition }} == 1) %>%
    group_by(!!!group_var) %>%
    summarise(conditionB_pop = n(), .groups = "drop")





  final_b <- left_join(denominator_b, numerator_b) %>%
    mutate(crude_rate = conditionB_pop / LocalityB_pop) %>%
    mutate(crude_prevalence = (conditionB_pop / LocalityB_pop) * 1000) %>%
    left_join(pop_standard) %>%
    mutate(Expected_Cohort_Size = crude_rate * Pop_Weight) %>%
    rename(
      "{{LocalityB}}_Pop" := LocalityB_pop,
      "{{Condition}}_Pop" := conditionB_pop
    )



  standard_rate_b <- left_join(denominator_b, numerator_b) %>%
    mutate(crude_rate = conditionB_pop / LocalityB_pop) %>%
    left_join(pop_standard) %>%
    mutate(Expected_Cohort_Size = crude_rate * Pop_Weight) %>%
    summarise((sum(Expected_Cohort_Size, na.rm = TRUE) / overall_pop_sum) * 1000, .groups = "drop") %>%
    pull()


  # Output Messages


  if (is.null(Population_Standard)) {
    message("Population Standardisation Based Upon Input DataFrame")
  } else {
    message("\nPopulation Standardisation Based Upon User Defined Population Weight ")
  }



  message("\nStandardisng By", paste0(group_var), "\n")



  message(paste0(LocalityA), " (Locality A)  Standardised Prevalence Rate: ", round(standard_rate_a, 2))

  message(paste0(LocalityB), " (Locality B)  Standardised Prevalence Rate: ", round(standard_rate_b, 2))



  message(
    "\nThe Comparative  Standardised Prevalence Ratio of\n",
    paste0(LocalityA), " to ",
    paste0(LocalityB), " is ", round(standard_rate_a / standard_rate_b, 3)
  )



  if (Verbose == TRUE) {
    print(final_a)

    print(final_b)
  }

  final_a$Location <- LocalityA

  final_b$Location <- LocalityB


  final_a <- janitor::clean_names(final_a)

  final_b <- janitor::clean_names(final_b)

  final_output <- list(final_a, final_b)
}
