test_that("excel_clip warns on non-data.frame input", {
  expect_warning(
    suppressMessages(excel_clip(df = list(a = 1))),
    "Non Tibble"
  )
})

test_that("excel_clip live clipboard path runs only on Windows", {
  skip_on_os(c("mac", "linux", "solaris"))
  skip_on_cran()
  data("PopHealthData", package = "SangerTools")
  expect_message(excel_clip(PopHealthData), "Clipboard")
})
