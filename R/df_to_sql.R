#' DataFrame to SQL; Write your DataFrame or Tibble directly to SQL from R
#' @param dataframe A DataFrame or Tibble ie PopHealthData
#' @param driver A driver for database ie "SQL Server"
#' @param server The unique name of your database server
#' @param database The name of the database to which you will write `dataframe`
#' @param sql_table_name The name that `dataframe` will be referred to in SQL database
#' @param ... Function forwarding for additional functionality
#' @return A DataFrame or Tibble written to a SQL database of your choice
#' @examples
#' \dontrun{
#' library(odbc)
#' library(DBI)
#' health_data <- SangerTools::PopHealthData
#' df_to_sql(dataframe = health_data,
#'             driver  = "SQL SERVER",
#'            database = "DATABASE",
#'      sql_table_name = "New Table Name")
#' }
#' @export
df_to_sql <- function(dataframe,
                      driver,
                      server,
                      database,
                      sql_table_name,
                      ...){

    con <- dbConnect(
    odbc(),
    Driver = driver,
    Server = server,
    Database = database,
    Trusted_Connection = "True"
    )

  table_name <- Id(schema = "DBO",
                   table = sql_table_name)

  dbWriteTable(conn = con,
               name = table_name,
               value = dataframe,
               overwrite = TRUE,
               row.names = FALSE)
  message("\nData ", " Written to ",
          "[",database,"]",".[DBO]",".[",as.character(table_name@name)[2],"]")

}
