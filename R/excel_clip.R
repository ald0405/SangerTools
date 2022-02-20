#' @title
#' Dataframe or Tibble to Clipboard
#' @description
#' This function copies a data frame or tibble to your clipboard in a format that allows
#' for a simple paste into excel whilst maintaining column and row structure.
#' By default row_names has been set to FALSE.
#' @importFrom utils write.table
#' @param df A dataframe or tibble
#' @param row_names Set to FALSE for row.names not to be included
#' @param col_names Set to TRUE for col.names to be included
#' @param ... function forwarding for additional write.table functionality
#' @return a data frame copied to your clipboard
#' @export

excel_clip <- function(df,
                       row_names = FALSE,
                       col_names = TRUE,
                       ...) {
  if (is_tibble(df) == FALSE & is.data.frame(df) == FALSE) {
    warning("Check Input df: Non Tibble or DataFrame Object Detected")
  } else {
  write.table(
    df,
    "clipboard",
    sep = "\t",
    row.names = row_names,
    col.names = col_names,
    ...
  )
}
  message("Your DataFrame is Now Copied to Clipboard & Can Be Pasted")
}
