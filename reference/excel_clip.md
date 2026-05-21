# Dataframe or Tibble to Clipboard

This function copies a data frame or tibble to your clipboard in a
format that allows for a simple paste into excel whilst maintaining
column and row structure. By default row_names has been set to FALSE.

## Usage

``` r
excel_clip(df, row_names = FALSE, col_names = TRUE, ...)
```

## Arguments

- df:

  A dataframe or tibble

- row_names:

  Set to FALSE for row.names not to be included

- col_names:

  Set to TRUE for col.names to be included

- ...:

  function forwarding for additional write.table functionality

## Value

a data frame copied to your clipboard
