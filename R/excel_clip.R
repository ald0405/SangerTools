#' Dataframe to Clipboard
#' This function copies a dataframe to your clipboard.
#' @importFrom utils write.table
#' @param df Dataframe
#' @param row_names Set to FALSE
#' @param col_names Set to TRUE
#' @param ... function forwarding
#' @return a data frame copied to your clipboard
#' @examples
#' \dontrun{
#' excel_clip(dataframe)}
#' @export

excel_clip <- function(df,
                       row_names = FALSE,
                       col_names = TRUE,
                       ...) {
  write.table(
    df,
    "clipboard",
    sep = "\t",
    row_names = row.names,
    col_names = col.names,
    ...
  )

  message("Your Item is Now Copied to Clipboard")

}


