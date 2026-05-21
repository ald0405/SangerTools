test_that("df_to_sql rejects non-data.frame input before attempting connection", {
  expect_error(
    df_to_sql(
      df = list(a = 1),
      driver = "SQL Server",
      server = "localhost",
      database = "test",
      sql_table_name = "tmp"
    ),
    "Non Tibble"
  )
})

test_that("df_to_sql live path is exercised separately (requires SQL Server ODBC)", {
  skip("requires a configured SQL Server ODBC connection; covered by integration setup, not CRAN")
})
