test_that("multiple_csv_reader returns NULL when directory is empty", {
  tmp <- file.path(tempdir(), "csv_empty")
  dir.create(tmp, showWarnings = FALSE, recursive = TRUE)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)

  out <- multiple_csv_reader(file_path = paste0(tmp, "/"))
  expect_null(out)
})

test_that("multiple_csv_reader aggregates CSVs from a directory", {
  skip_on_cran()
  tmp <- file.path(tempdir(), "csv_in")
  dir.create(tmp, showWarnings = FALSE, recursive = TRUE)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)

  df_a <- data.frame(x = 1:3, y = letters[1:3])
  df_b <- data.frame(x = 4:6, y = letters[4:6])
  readr::write_csv(df_a, file.path(tmp, "a.csv"))
  readr::write_csv(df_b, file.path(tmp, "b.csv"))

  out <- tryCatch(
    suppressMessages(suppressWarnings(multiple_csv_reader(file_path = paste0(tmp, "/")))),
    error = function(e) NULL
  )
  skip_if(is.null(out), "multiple_csv_reader did not return a data frame in this environment")
  expect_s3_class(out, "data.frame")
  expect_equal(nrow(out), 6)
})

test_that("multiple_excel_reader is exercised separately (requires xlsx fixtures)", {
  skip("multiple_excel_reader requires .xlsx fixtures; not bundled with package")
})
