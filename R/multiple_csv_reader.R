#' @title Read Multiple CSV files into R
#' @description
#' This function reads multiple CSVs in a directory must be same structure.
#' This function reads multiple excel files into R after which all files are aggregated into  a single data frame.
#'
#'
#' There are assumptions about they underlying files:
#'\itemize{
#'   \item All files must have column names for each column (The function will fail without this; later versions will amend this)
#'   \item All files have the same number of columns
#'   \item All files have the same column names
#'   \item All files should have data starting from the same row number
#'   \item All relevant data is stored in the same sheet in each of the files
#' }
#' @importFrom readr read_csv
#' @importFrom janitor clean_names
#' @param file_path The Directory in which the files are located
#' @param sheet Sheet to read. Either a string (the name of a sheet), or an integer (the position of the sheet). Defaults to the first sheet
#' @param rows_to_skip The number of rows from the top to be excluded
#' @param col_names If columns are named; defaults to TRUE
#' @return a data frame object full of file paths
#' @examples
#' library(SangerTools)
#' file_path <- "my_file_path_where_csvs_are_stored"
#' if (length(SangerTools::multiple_csv_reader(file_path)) == 0) {
#'   message("This won't work without changing the variable input to a local file path with CSVs in")
#' }
#' @export

multiple_csv_reader <- function(file_path,sheet = 1, rows_to_skip = 0,
                                col_names = TRUE) {
  list_of_files <-
    list.files(
      path = file_path,
      full.names = TRUE,
      pattern = "*.csv"
    )

  all <-
    lapply(list_of_files,
      read_csv,
      sheet = sheet,
      skip = rows_to_skip,
      col_names = col_names
    )
  all_cleaned <- lapply(all, clean_names)
  final_table <- do.call(rbind, all_cleaned)
  return(final_table)
}
