# Read Multiple CSV files into R

This function reads multiple CSVs in a directory must be same structure.
This function reads multiple excel files into R after which all files
are aggregated into a single data frame.

There are assumptions about they underlying files:

- All files must have column names for each column (The function will
  fail without this; later versions will amend this)

- All files have the same number of columns

- All files have the same column names

- All files should have data starting from the same row number

- All relevant data is stored in the same sheet in each of the files

## Usage

``` r
multiple_csv_reader(file_path, sheet = 1, rows_to_skip = 0, col_names = TRUE)
```

## Arguments

- file_path:

  The Directory in which the files are located

- sheet:

  Sheet to read. Either a string (the name of a sheet), or an integer
  (the position of the sheet). Defaults to the first sheet

- rows_to_skip:

  The number of rows from the top to be excluded

- col_names:

  If columns are named; defaults to TRUE

## Value

a data frame object full of file paths

## Examples

``` r
library(SangerTools)
file_path <- "my_file_path_where_csvs_are_stored"
if (length(SangerTools::multiple_csv_reader(file_path)) == 0) {
  message("This won't work without changing the variable input to a local file path with CSVs in")
}
#> This won't work without changing the variable input to a local file path with CSVs in
```
