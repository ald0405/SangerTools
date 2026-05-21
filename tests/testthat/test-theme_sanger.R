test_that("theme_sanger returns a ggplot theme", {
  t <- theme_sanger()
  expect_s3_class(t, "theme")
})

test_that("scale_fill_sanger returns a ggplot scale", {
  s <- scale_fill_sanger()
  expect_s3_class(s, "ScaleDiscrete")
})

test_that("palette helpers return the colour vector", {
  pdf(NULL)
  on.exit(dev.off(), add = TRUE)

  out_brand <- capture.output(res_brand <- show_brand_palette())
  expect_type(res_brand, "character")
  expect_length(res_brand, 5)

  out_ext <- capture.output(res_ext <- show_extended_palette())
  expect_type(res_ext, "character")
  expect_length(res_ext, 12)
})
