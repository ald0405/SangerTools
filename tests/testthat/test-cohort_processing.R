test_that("cohort_processing writes one CSV per Split_by level", {
  data("PopHealthData", package = "SangerTools")
  tmp <- file.path(tempdir(), "cohort_test")
  dir.create(tmp, showWarnings = FALSE, recursive = TRUE)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)

  cohort_processing(
    df = PopHealthData,
    Split_by = "Locality",
    path = paste0(tmp, "/")
  )
  written <- list.files(tmp, pattern = "\\.csv$")
  expect_equal(length(written), length(unique(PopHealthData$Locality)))
  expect_true(all(grepl("DSCRO_11M_", written)))
})

test_that("split_and_save writes one CSV per Split_by level", {
  data("PopHealthData", package = "SangerTools")
  tmp <- file.path(tempdir(), "split_test")
  dir.create(tmp, showWarnings = FALSE, recursive = TRUE)
  on.exit(unlink(tmp, recursive = TRUE), add = TRUE)

  split_and_save(
    df = PopHealthData,
    Split_by = "Locality",
    path = paste0(tmp, "/")
  )
  written <- list.files(tmp, pattern = "\\.csv$")
  expect_equal(length(written), length(unique(PopHealthData$Locality)))
})
