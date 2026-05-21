test_that("PopHealthData loads with expected shape", {
  data("PopHealthData", package = "SangerTools")
  expect_s3_class(PopHealthData, "data.frame")
  expect_gt(nrow(PopHealthData), 0)
  expected_cols <- c(
    "Sex", "Smoker", "Diabetes", "AgeBand", "IMD_Decile",
    "Ethnicity", "Locality", "PrimaryCareNetwork"
  )
  expect_true(all(expected_cols %in% names(PopHealthData)))
})

test_that("master_patient_index loads with expected shape", {
  data("master_patient_index", package = "SangerTools")
  expect_s3_class(master_patient_index, "data.frame")
  expect_gt(nrow(master_patient_index), 0)
  expect_true(all(c("Age", "Sex", "Diabetes", "Locality") %in% names(master_patient_index)))
  expect_true(is.numeric(master_patient_index$Age))
})

test_that("uk_pop_standard loads with expected shape", {
  data("uk_pop_standard", package = "SangerTools")
  expect_s3_class(uk_pop_standard, "data.frame")
  expect_gt(nrow(uk_pop_standard), 0)
  expect_true("Ageband" %in% names(uk_pop_standard))
})
