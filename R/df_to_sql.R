#' DataFrame to SQL; Write your DataFrame or Tibble directly to SQL from R
#' @param df A DataFrame or Tibble ie PopHealthData
#' @param driver A driver for database ie "SQL Server"; must be passed in quotation
#' @param server The unique name of your database server; must be passed in quotation
#' @param database The name of the database to which you will write `df`; must be passed in quotation
#' @param sql_table_name The name that `df` will be referred to in SQL database; must be passed in quotation
#' @param ... Function forwarding for additional functionality
#' @return A message confirming that a new  table has been created in a SQL `database`
#' @importFrom DBI dbConnect Id dbWriteTable
#' @importFrom odbc odbc
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
df_to_sql <- function(df,
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
               value = df,
               overwrite = TRUE,
               row.names = FALSE)
  message("\nData ", " Written to ",
          "[",database,"]",".[DBO]",".[",as.character(table_name@name)[2],"]")

}
