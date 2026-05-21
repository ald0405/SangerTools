test_that("standardised_rates_df produces one row per split level", {
  data("master_patient_index", package = "SangerTools")
  banded <- age_bandizer(master_patient_index, Age)
  out <- standardised_rates_df(
    df = banded,
    Split_by = Locality,
    Condition = Diabetes,
    Population_Standard = NULL,
    Granular = FALSE,
    Ageband
  )
  expect_s3_class(out, "data.frame")
  expect_true("Standardised_Rate_1k" %in% names(out))
  expect_equal(nrow(out), length(unique(banded$Locality)))
  expect_true(all(out$Standardised_Rate_1k >= 0))
})

test_that("standardised_rates_df granular mode returns more rows", {
  data("master_patient_index", package = "SangerTools")
  banded <- age_bandizer(master_patient_index, Age)
  granular <- standardised_rates_df(
    df = banded,
    Split_by = Locality,
    Condition = Diabetes,
    Population_Standard = NULL,
    Granular = TRUE,
    Ageband
  )
  expect_s3_class(granular, "data.frame")
  expect_gt(nrow(granular), length(unique(banded$Locality)))
})
