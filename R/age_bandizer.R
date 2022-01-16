#' Age Band Creation: Create a new column of 5 year Age Bands from an integer column
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData
#' @param Age_col a integer column within @param df NAs must be removed or imputed prior to running this function
#' @return A dataframe with width ncol(df)+1, new column will be named Ageband and will be a factor with levels defined
#' @importFrom dplyr case_when select
#' @examples
#' library(SangerTools)
#' library(dplyr)
#' health_data <- SangerTools::PopHealthData
#' @export

age_bandizer <- function(df, Age_col) {
  tester <- df %>%
    select({{ Age_col }})

  if (!is.numeric(tester[[1]])) {
    stop("Check Input Age_Col: Non-Numeric Input Values Detected")
  } else {
    bandized_df <- df %>%
      mutate(Ageband = case_when(
        {{ Age_col }} >= 0 & {{ Age_col }} < 5 ~ "0-4",
        {{ Age_col }} > 4 & {{ Age_col }} < 10 ~ "5-9",
        {{ Age_col }} > 9 & {{ Age_col }} < 15 ~ "10-14",
        {{ Age_col }} > 14 & {{ Age_col }} < 20 ~ "15-19",
        {{ Age_col }} > 19 & {{ Age_col }} < 25 ~ "20-24",
        {{ Age_col }} > 24 & {{ Age_col }} < 30 ~ "25-29",
        {{ Age_col }} > 29 & {{ Age_col }} < 35 ~ "30-34",
        {{ Age_col }} > 34 & {{ Age_col }} < 40 ~ "35-39",
        {{ Age_col }} > 39 & {{ Age_col }} < 45 ~ "40-44",
        {{ Age_col }} > 44 & {{ Age_col }} < 50 ~ "45-49",
        {{ Age_col }} > 49 & {{ Age_col }} < 55 ~ "50-54",
        {{ Age_col }} > 54 & {{ Age_col }} < 60 ~ "55-59",
        {{ Age_col }} > 59 & {{ Age_col }} < 65 ~ "60-64",
        {{ Age_col }} > 64 & {{ Age_col }} < 70 ~ "65-69",
        {{ Age_col }} > 69 & {{ Age_col }} < 75 ~ "70-74",
        {{ Age_col }} > 74 & {{ Age_col }} < 80 ~ "75-79",
        {{ Age_col }} > 79 & {{ Age_col }} < 85 ~ "80-84",
        {{ Age_col }} > 84 & {{ Age_col }} < 90 ~ "85-89",
        {{ Age_col }} > 89 & {{ Age_col }} < 95 ~ "90-94",
        {{ Age_col }} > 94 & {{ Age_col }} < 100 ~ "95-99",
        {{ Age_col }} >= 100 ~ "100+"
      ))


    bandized_df$Ageband <- factor(
      x = bandized_df$Ageband,
      levels = c(
        "0-4",
        "5-9",
        "10-14",
        "15-19",
        "20-24",
        "25-29",
        "30-34",
        "35-39",
        "40-44",
        "45-49",
        "50-54",
        "55-59",
        "60-64",
        "65-69",
        "70-74",
        "75-79",
        "80-84",
        "85-89",
        "90-94",
        "95-99",
        "100+"
      )
    )
    return(bandized_df)
  }
}
