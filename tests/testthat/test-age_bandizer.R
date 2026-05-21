test_that("age_bandizer adds Ageband factor column", {
  df <- data.frame(Age = c(2L, 22L, 47L, 73L, 101L))
  out <- age_bandizer(df, Age)
  expect_true("Ageband" %in% names(out))
  expect_s3_class(out$Ageband, "factor")
  expect_equal(nrow(out), nrow(df))
  expect_equal(as.character(out$Ageband), c("0-4", "20-24", "45-49", "70-74", "100+"))
})

test_that("age_bandizer errors on non-numeric Age column", {
  df <- data.frame(Age = c("two", "twenty", "forty"))
  expect_error(age_bandizer(df, Age), "Non-Numeric")
})

test_that("age_bandizer_2 supports configurable band size", {
  df <- data.frame(Age = c(3L, 11L, 27L, 64L))
  out_5 <- age_bandizer_2(df, Age_col = "Age", Age_band_size = 5)
  expect_true("Ageband" %in% names(out_5))
  expect_s3_class(out_5$Ageband, "factor")

  out_10 <- age_bandizer_2(df, Age_col = "Age", Age_band_size = 10)
  expect_s3_class(out_10$Ageband, "factor")
  expect_equal(nrow(out_10), nrow(df))
})
