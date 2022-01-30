#' @title Read Multiple Excel files into R
#' @description
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
#' To understand more about the underlying function that `multiple_excel_reader` wraps around \href{https://www.rdocumentation.org/packages/readxl/versions/0.1.1/topics/read_excel}{Click Here}
#' @importFrom readxl read_excel
#' @importFrom janitor clean_names
#' @param file_path The Directory in which the files are located
#' @param pattern The file extension of the files of which you are going to read. Defaults to "*.xlsx"
#' @param sheet Sheet to read. Either a string (the name of a sheet), or an integer (the position of the sheet). Defaults to the first sheet
#' @param rows_to_skip The number of rows from the top to be excluded
#' @param col_names A boolean value to determine if column headers name are present in files. Currently only accepts TRUE
#' @return a data frame object full of file paths
#' @examples
#' \dontrun{
#' combined_excel_files <- multiple_excel_reader("Inputs/", 1, TRUE)
#' }
#' @export

multiple_excel_reader <- function(file_path,pattern = "*.xlsx",sheet = 1, rows_to_skip = 0, col_names = TRUE) {
  # Aggregate file paths for reading
  list_of_files <-
    list.files(
      path = file_path,
      full.names = TRUE,
      pattern = pattern
    )
  message(length(list_of_files)," files found")
  # Iterate over each file path
  all <-
    lapply(list_of_files,
      read_excel,
      sheet = sheet,
      skip = rows_to_skip,
      col_names = col_names
    )
  # Clean names
  all_cleaned <- lapply(all, clean_names)
  # Combine into final data frame for output
  final_table <- do.call(rbind, all_cleaned)

  return(final_table)
}
