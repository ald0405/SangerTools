#' Direct Standardised Prevalence Rates
#' @param df a  tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData
#' @param Geography Column name denoting column with location string names
#' @param LocalityA A character string from @param Geography
#' @param LocalityB A character string from @param Geography
#' @param Condition A Health condition flag denoted by 1 & 0
#' @param Population_Standard Population Standard Weight for Standardising; defaults to NULL which will use Age Structure of @param  df
#' @param Verbose Takes boolean value to determine function output printing
#' @param ... Variables to Standardise by; Must always have Ageband, additional variables are optional
#' @return List of length 2 containing 2 tibbles with standardised rates for @param LocalityA and @param LocalityB
#' @importFrom dplyr ungroup count summarise group_by n mutate left_join pull rename filter enquos
#' @importFrom janitor clean_names
#' @importFrom magrittr %>%
#' @importFrom rlang :=
#' @export
compare_standardised_rates <- function(df, Geography, LocalityA, LocalityB, Condition, Population_Standard = NULL, Verbose = TRUE,...){

  group_var <- enquos(...)
  # Standard Population
  if (is.null(Population_Standard)) {
    pop_standard <- df %>%
      group_by(!!!group_var) %>%
      count(name = "Pop_Weight")

    overall_pop_sum <- pop_standard %>%
      ungroup() %>%
      summarise(total_pop = sum(Pop_Weight,na.rm = TRUE))

  }

  else {
    pop_standard <- Population_Standard %>%
      group_by(!!!group_var) %>%
      count(name = "Pop_Weight")

    overall_pop_sum <-pop_standard %>%
      ungroup() %>%
      summarise(total_pop = sum(Pop_Weight,na.rm = TRUE))
  }

  # For Population A --------------------------------------------------------
  # Population in Locality

  denominator_a <- df %>%
    filter( {{Geography}} == LocalityA ) %>%
    group_by(!!!group_var) %>%
    summarise(LocalityA_pop = n(),.groups = "drop"  )

  # Population in Locality with Condition

  numerator_a <- df %>%
    filter( {{Geography}} == LocalityA ) %>%
    filter( {{Condition}} == 1) %>%
    group_by(!!!group_var) %>%
    summarise(conditionA_pop = n(),.groups = "drop"  )


  # Crude Prevalence

  final_a <- left_join(denominator_a,numerator_a) %>%
    mutate(crude_rate = conditionA_pop / LocalityA_pop) %>%
    mutate(crude_prevalence = (conditionA_pop / LocalityA_pop) * 1000 )  %>%
    # Age Standardised
    left_join(pop_standard) %>%
    mutate(Expected_Prevalence = crude_rate * Pop_Weight) %>%
    rename("{{LocalityA}}_Pop" :=LocalityA_pop,
           "{{Condition}}_Pop":= conditionA_pop)


  standard_rate_a <- left_join(denominator_a,numerator_a) %>%
    mutate(crude_rate = conditionA_pop / LocalityA_pop) %>%
    left_join(pop_standard) %>%
    mutate(Expected_Prevalence = crude_rate * Pop_Weight) %>%
    #drop_na() %>%
    summarise((sum(Expected_Prevalence,na.rm = TRUE)/overall_pop_sum) * 1000,.groups = "drop") %>%
    pull()

  # For Population B --------------------------------------------------------

  # Population in Locality B

  denominator_b <- df %>%
    filter( {{Geography}} == LocalityB ) %>%
    group_by(!!!group_var) %>%
    summarise(LocalityB_pop = n(),.groups = "drop" )
  # Population in Locality with Condition

  numerator_b <- df %>%
    filter( {{Geography}} == LocalityB ) %>%
    filter( {{Condition}} == 1) %>%
    group_by(!!!group_var) %>%
    summarise(conditionB_pop = n(),.groups = "drop")


  final_b<- left_join(denominator_b,numerator_b) %>%
    mutate(crude_rate = conditionB_pop / LocalityB_pop) %>%
    mutate(crude_prevalence = (conditionB_pop / LocalityB_pop) * 1000) %>%
    left_join(pop_standard) %>%
    mutate(Expected_Prevalence = crude_rate * Pop_Weight) %>%
    rename("{{LocalityB}}_Pop" := LocalityB_pop,
           "{{Condition}}_Pop" := conditionB_pop)


  standard_rate_b <- left_join(denominator_b,numerator_b) %>%
    mutate(crude_rate = conditionB_pop / LocalityB_pop) %>%
    left_join(pop_standard) %>%
    mutate(Expected_Prevalence = crude_rate * Pop_Weight) %>%
    summarise((sum(Expected_Prevalence,na.rm = TRUE)/overall_pop_sum) * 1000,.groups = "drop") %>%
    pull()


  if( is.null(Population_Standard)){
    message("Based upon Population Stucture of Dataset Base Population")
  }

  else {

    message("Based upon User Defined Population Stucture")

  }

  message("Locality A Age Standardised Prevalence Rate: ",round(standard_rate_a,2))

  message("Locality B Age Standardised Prevalence Rate: ",round(standard_rate_b,2))

  message("The Comparative Age Standardised Prevalence Ratio of Locality A to Locality B is ",round(standard_rate_a/standard_rate_b,3))


  if(Verbose == TRUE){

    print(final_a)

    print(final_b)

  }

  final_a$Location <- LocalityA

  final_b$Location <- LocalityB

  final_a <- janitor::clean_names(final_a)

  final_b <- janitor::clean_names(final_b)

  final_output <- list(final_a,final_b)

  #return(final_output)

}





