#' DataFrame to SQL; Write your DataFrame or Tibble directly to SQL from R
#' @description
#' This wrapper functions allows for the easy movement of your computed results in R
#' to a SQL Database for saving. The function uses a ODBC driver to establish a connection.
#' You will need to select a Database that your user has write-access to. The user
#' credentials are the same as your OS login details; as such this function will
#' most likely only work from you work computer.
#' @param df A `dataFrame` or `tibble` ie PopHealthData.
#' @param driver A driver for database ie "SQL Server"; must be passed in quotation.
#' @param server The unique name of your database server; must be passed in quotation.
#' @param database The name of the database to which you will write `df`; must be passed in quotation.
#' @param sql_table_name The name that `df` will be referred to in SQL database; must be passed in quotation.
#' @param ... Function forwarding for additional functionality.
#' @return A message confirming that a new  table has been created in a SQL `database`.
#' @importFrom DBI dbConnect Id dbWriteTable
#' @importFrom odbc odbc
#' @importFrom tibble is_tibble
#' @examples
#' \dontrun{
#' library(odbc)
#' library(DBI)
#' health_data <- SangerTools::PopHealthData
#' df_to_sql(
#'   dataframe = health_data,
#'   driver = "SQL SERVER",
#'   database = "DATABASE",
#'   sql_table_name = "New Table Name"
#' )
#' }
#' @export
df_to_sql <- function(df,
                      driver,
                      server,
                      database,
                      sql_table_name,
                      ...) {
  if (is_tibble(df) == FALSE & is.data.frame(df) == FALSE) {
    stop("Check Input df: Non Tibble or DataFrame Object Detected")
  } else {
    # Establish Connection[Will only work based on OS Login Credentials]
    con <- dbConnect(
      odbc(),
      Driver = driver,
      Server = server,
      Database = database,
      Trusted_Connection = "True"
    )
    # Format SQL Table Name String
    table_name <- Id(
      schema = "DBO",
      table = sql_table_name
    )
    # Write Table to Database
    dbWriteTable(
      conn = con,
      name = table_name,
      value = df,
      overwrite = TRUE,
      row.names = FALSE
    )
    message(
      "\nData ", " Written to ",
      "[", database, "]", ".[DBO]", ".[", as.character(table_name@name)[2], "] by", Sys.info()[[6]]
    )
  }
}
