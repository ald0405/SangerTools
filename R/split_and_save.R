#' Split & Save
#' @description
#' A simpler alternative to  \code{\link{cohort_processing}}. Will split a data frame
#' and save as a csv
#' @param df A `dataFrame` or `tibble` ie PopHealthData.
#' @param Split_by A column within df that will be used to split the patients and will also appear in the file name. Ideally should be a health organisation code such as GP Practice Code or Hospital Trust Code. Should only have alpha-numeric values
#' @param path A file path to which the CSV files will be written
#' @param prefix File name prefix
#' @importFrom readr write_csv
#'
#' @return n number of CSV files written to the location specified by path argument.
#' @export
#'
#' @examples
#'  \dontrun{
#' split_and_save(
#'  df = pseudo_data,
#'  Split_by = "Locality",
#'  file_path = "Inputs/",
#'  prefix = NULL
#')
#'}
#'
#'
#'
split_and_save <- function(df, Split_by, path, prefix = NULL) {
  final <- split(df, df[[Split_by]])

  lapply(
    final,
    function(df) {
      write_csv(
        df,
        paste0(
          path,
          prefix,
          unique(df[Split_by]), ".csv"
        )
      )
    }
  )
}



