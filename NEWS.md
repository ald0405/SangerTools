# SangerTools 1.0.3

- **Refreshed `theme_sanger()`**: rebuilt on top of `ggplot2::theme_minimal`
  with NHS Identity colours and a sleek, minimal layout inspired by modern
  wearables (Whoop, Withings). Drops the dated `theme_fivethirtyeight`
  base. Gains optional `base_size` and `base_family` arguments;
  parameterless calls remain backwards compatible.
- **Refreshed `scale_fill_sanger()`** and the palette helpers
  (`show_brand_palette()`, `show_extended_palette()`) to use NHS Identity
  hues with two accent colours (lime, magenta). Same return shape and
  vector lengths as before, so existing call sites continue to work.
- Removed `ggthemes` from `Imports` (no longer used).
- Added a `testthat` (edition 3) test suite covering every exported function
  and bundled dataset. No code changes to exported functions; tests document
  current behaviour and protect against regressions.
- Expanded the GitHub Actions `R-CMD-check` workflow to a matrix of
  `{macOS, Windows, Ubuntu} x {R-release, R-devel, R-oldrel-1}`.
- Added a `test-coverage` workflow (covr + Codecov) and a `pkgdown` workflow
  that builds and deploys <https://ald0405.github.io/SangerTools/> on each
  push to `master`.
- Added a new vignette, `demo-data-and-functions`, that walks through the
  three bundled datasets and exercises every exported function in one
  notebook.
- Documented that `df_to_sql()` targets Microsoft SQL Server via ODBC under
  Windows integrated security (behaviour unchanged).
- Removed the dead AppVeyor badge from `README.md`; added Codecov,
  pkgdown, lifecycle and R-CMD-check badges.
- Bumped the declared minimum R version from `2.10` to `3.5.0` to match
  current CRAN policy and the dependencies actually used.
- Refreshed `RoxygenNote` to `7.3.2`.

# SangerTools 1.0.2

- Added `df_to_sql()`.
- Added `scale_fill_sanger()`.
- Added `split_and_save()`.
- Added `uk_pop_standard` dataset.

# SangerTools 1.0.1

- Initial release of the analytic tools to build efficiency. Contains
  various useful functions.
