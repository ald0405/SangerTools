test_that("categorical_col_chart returns a ggplot object", {
  data("PopHealthData", package = "SangerTools")
  p <- categorical_col_chart(PopHealthData, Locality)
  expect_s3_class(p, "ggplot")
})
