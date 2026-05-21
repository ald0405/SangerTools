# Age Band Creation: Create a new column of 5 year Age Bands from an integer column

Age Band Creation: Create a new column of 5 year Age Bands from an
integer column

## Usage

``` r
age_bandizer(df, Age_col)
```

## Arguments

- df:

  a tidy dataframe in standard Master Patient Index format ie
  SangerTools::PopHealthData

- Age_col:

  a integer column within @param df NAs must be removed or imputed prior
  to running this function

## Value

A dataframe with width ncol(df)+1, new column will be named Ageband and
will be a factor with levels defined

## Examples

``` r
library(SangerTools)
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
health_data <- SangerTools::PopHealthData
```
