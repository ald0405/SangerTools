# Read Multiple Excel files into R

This function reads multiple excel files into R after which all files
are aggregated into a single data frame.

There are assumptions about they underlying files:

- All files must have column names for each column (The function will
  fail without this; later versions will amend this)

- All files have the same number of columns

- All files have the same column names

- All files should have data starting from the same row number

- All relevant data is stored in the same sheet in each of the files

To understand more about the underlying function that
\`multiple_excel_reader\` wraps around [Click
Here](https://www.rdocumentation.org/packages/readxl/versions/0.1.1/topics/read_excel)

## Usage

``` r
multiple_excel_reader(
  file_path,
  pattern = "*.xlsx",
  sheet = 1,
  rows_to_skip = 0,
  col_names = TRUE
)
```

## Arguments

- file_path:

  The Directory in which the files are located

- pattern:

  The file extension of the files of which you are going to read.
  Defaults to "\*.xlsx"

- sheet:

  Sheet to read. Either a string (the name of a sheet), or an integer
  (the position of the sheet). Defaults to the first sheet

- rows_to_skip:

  The number of rows from the top to be excluded

- col_names:

  A boolean value to determine if column headers name are present in
  files. Currently only accepts TRUE

## Value

a data frame object full of file paths

## Examples

``` r
if (FALSE) { # \dontrun{
combined_excel_files <- multiple_excel_reader("Inputs/", 1, TRUE)
} # }
```
