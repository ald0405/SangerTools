## Submission notes

This is a maintenance release for SangerTools (1.0.3) after a period of
inactivity. There are no breaking changes; the package's exported API,
NAMESPACE, and bundled datasets are unchanged versus 1.0.2.

The release focuses on:

* Adding a `testthat` (edition 3) suite covering every exported function and
  every bundled dataset.
* Refreshing the CI matrix to `{macOS, Windows, Ubuntu} x
  {R-release, R-devel, R-oldrel-1}` (see `.github/workflows/R-CMD-check.yaml`).
* Adding a pkgdown site and a coverage workflow.
* Adding a new `demo-data-and-functions` vignette.
* Documenting that `df_to_sql()` targets Microsoft SQL Server via ODBC.
* Bumping the declared minimum R version from `2.10` to `3.5.0`.

## Test environments

GitHub Actions (see badges on the project README and the matrix at
`.github/workflows/R-CMD-check.yaml`):

* macOS-latest, R-release
* Windows-latest, R-release
* Ubuntu-latest, R-devel
* Ubuntu-latest, R-release
* Ubuntu-latest, R-oldrel-1

To be filled in once the CI matrix has completed on the release branch:

* All checks: 0 errors, 0 warnings, 0 notes.

## R CMD check results

To be confirmed against the CI matrix on the release branch.

## Downstream dependencies

There are currently no downstream dependencies for this package to my
knowledge.
