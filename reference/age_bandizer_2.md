# Create age bands from a numerical column

An alternative age banding function that allows users greater
flexibility for defining band size. This function utilises Base R
standard evaluation. The function currently supports band size of 2, 5,
10 & 20. The input,column, Age_col should be numeric and must not
contain NAs; if either of these conditions is violated the function will
terminate.

## Usage

``` r
age_bandizer_2(df, Age_col, Age_band_size = 5)
```

## Arguments

- df:

  A dataframe with a numerical column denoting Age.

- Age_col:

  A numerical column within \`df\`; passed with quotation marks.

- Age_band_size:

  The size of the Age band to use. Defaults to 5; will take values
  2,5,10,20.

## Value

A dataframe containing a new column \`Ageband\` which has factor levels
defined.

## Examples

``` r
if (FALSE) { # \dontrun{
library(SangerTools)
df <- data.frame(Age = sample(x = 0:120, size = 100, replace = TRUE))
df_agebanded <- age_bandizer_2(
  df = df,
  Age_col = "Age",
  Age_band = 5
)
print(df_agebanded)
} # }
```
