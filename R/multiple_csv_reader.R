#' Read Multiple CSV files into R
#' @description This function reads multiple CSVs in a directory;
#'              must be same structure
#' @importFrom readr read_csv
#' @importFrom janitor clean_names
#' @param file_path The Directory in which the files are located
#' @param rows_to_skip The number of rows from the top to be excluded
#' @param col_names If columns are named; defaults to TRUE
#'
#' @return
#' @export
#'
#' @examples
#' combined_csv_files <- multiple_csv_reader("Inputs/",1,TRUE)
multiple_csv_reader <- function(file_path, rows_to_skip = 0, col_names = TRUE) {

  list_of_files <-

    list.files(path = file_path,

               full.names = TRUE,

               pattern = "*.csv")

  all <-

    lapply(list_of_files,
           read_csv,
           skip = rows_to_skip,
           col_names = col_names
           )




  all_cleaned <- lapply(all, clean_names)



  final_table <- do.call(rbind, all_cleaned)



  return(final_table)

}
