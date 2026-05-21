# Split & Save

A simpler alternative to
[`cohort_processing`](https://ald0405.github.io/SangerTools/reference/cohort_processing.md).
Will split a data frame and save as a csv

## Usage

``` r
split_and_save(df, Split_by, path, prefix = NULL)
```

## Arguments

- df:

  A \`dataFrame\` or \`tibble\` ie PopHealthData.

- Split_by:

  A column within df that will be used to split the patients and will
  also appear in the file name. Ideally should be a health organisation
  code such as GP Practice Code or Hospital Trust Code. Should only have
  alpha-numeric values

- path:

  A file path to which the CSV files will be written

- prefix:

  File name prefix

## Value

n number of CSV files written to the location specified by path
argument.

## Examples

``` r
 if (FALSE) { # \dontrun{
split_and_save(
 df = pseudo_data,
 Split_by = "Locality",
 file_path = "Inputs/",
 prefix = NULL
)
} # }


```
