#' Dataframe to Clipboard
#' This function copies a dataframe to your clipboard.
#' @importFrom utils write.table
#' @param x Dataframe
#' @param row.names Set to FALSE
#' @param col.names Set to TRUE
#' @param ... function forwarding
#' @return a data frame copied to your clipboard
#' @examples
#' \dontrun{
#' excel_clip(dataframe)}
#' @export

excel_clip <- function(x,
                       row.names = FALSE,
                       col.names = TRUE,
                       ...) {
  write.table(
    x,
    "clipboard",
    sep = "\t",
    row.names = row.names,
    col.names = col.names,
    ...
  )

  message("Your Item is Now Copied to Clipboard")

}

