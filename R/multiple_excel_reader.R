#' Read Multiple Excel files into R
#' This function reads multiple Xlsx files in a directory must be same structure.
#' @importFrom readxl read_excel
#' @importFrom janitor clean_names
#' @param file_path The Directory in which the files are located
#' @param rows_to_skip The number of rows from the top to be excluded
#' @param col_names If columns are named; defaults to TRUE
#' @return a data frame object full of file paths
#' @examples
#' \dontrun{
#' combined_excel_files <- multiple_excel_reader("Inputs/",1,TRUE)}
#' @export

multiple_excel_reader <- function(file_path, rows_to_skip = 0, col_names = TRUE) {
  list_of_files <-
    list.files(path = file_path,
               full.names = TRUE,
               pattern = "*.xlsx")

  all <-
    lapply(list_of_files,
           read_excel,
           skip = rows_to_skip,
           col_names = col_names
           )
  all_cleaned <- lapply(all, clean_names)
  final_table <- do.call(rbind, all_cleaned)
  return(final_table)

}
