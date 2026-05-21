test_that("crude_rates returns prevalence per 1k by group", {
  data("PopHealthData", package = "SangerTools")
  out <- crude_rates(PopHealthData, Diabetes, Locality)
  expect_s3_class(out, "data.frame")
  expect_true("Prevalence_1k" %in% names(out))
  expect_true("Cohort_Size" %in% names(out))
  expect_equal(nrow(out), length(unique(PopHealthData$Locality)))
  expect_true(all(out$Prevalence_1k >= 0))
})

test_that("crude_rates errors on non-data.frame input", {
  expect_error(crude_rates(list(a = 1), Diabetes, Locality), "Non Tibble")
})
