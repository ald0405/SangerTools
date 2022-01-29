#' Create age bands from a numerical  column
#' @description
#' An alternative age banding function that allows users greater flexibility for defining band size.
#' This function utilises Base R standard evaluation. The function currently supports band size of 2, 5, 10 & 20.
#' The input,column, Age_col should be numeric and must not contain NAs; if either of these conditions is violated
#' the function will terminate.
#' @param df A dataframe with a numerical column denoting Age.
#' @param Age_col A numerical column within `df`; passed with quotation marks.
#' @param Age_band_size The size of the Age band to use. Defaults to 5; will take values 2,5,10,20.
#' @return A dataframe with a new column `Ageband`
#' @examples
#' \dontrun{
#' library(SangerTools)
#' df <- data.frame(Age = sample(x = 0:120, size = 100, replace = TRUE))
#' df_agebanded <- age_bandizer_2(
#'   df = df,
#'   Age_col = "Age",
#'   Age_band = 5
#' )
#' print(df_agebanded)
#' }
#' @export
#'
age_bandizer_2 <- function(df, Age_col, Age_band_size = 5) {
  if (!is.numeric(df[, Age_col]) | sum(is.na(df[, Age_col])) > 0) {

      stop("Check Input Column Is Numeric & Does Not Contain NAs")

  } else {
    age_band_labels <- c(
      paste(seq(0, 95, by = Age_band_size),
        seq(0 + Age_band_size - 1, 100 - 1, by = Age_band_size),
        sep = "-"
      ),
      paste(100, "+", sep = "")
    )

    df$Ageband <- cut(
      x = df[, Age_col],
      breaks = c(seq(0, 100, by = Age_band_size), Inf),
      labels = age_band_labels,
      right = FALSE
    )
    return(df)
  }
}
