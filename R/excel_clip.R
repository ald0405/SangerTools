#' Dataframe to Clipboard
#' This function copies a data frame to your clipboard.
#' @importFrom utils write.table
#' @param x Dataframe
#' @param row.names Set to FALSE for row.names not to be included
#' @param col.names Set to TRUE for col.names to be included
#' @param ... function forwarding for additional write.table functionality
#' @return a data frame copied to your clipboard
#' @examples
#' \donttest{
#' library(SangerTools)
#' library(dplyr)
#' # Group by Age Band
#' health_data <- SangerTools::PopHealthData
#' health_data %>%
#'  slice(1:10) %>%
#'  SangerTools::excel_clip(row.names = FALSE, col.names = TRUE)
#'  # Message: Your Item is Now Copied to Clipboard
#'  }
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

