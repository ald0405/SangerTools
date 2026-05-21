# Standardised Prevalence Rates.

Standardisation will be performed for all unique values in the column
passed to \`split_by\`. If input data frame does not contain age bands
or age bands are not of class factor, it is recommended to use
[`age_bandizer`](https://ald0405.github.io/SangerTools/reference/age_bandizer.md)
or
[`age_bandizer_2`](https://ald0405.github.io/SangerTools/reference/age_bandizer_2.md).
After the function has run, the output can be copied using
[`excel_clip`](https://ald0405.github.io/SangerTools/reference/excel_clip.md)
or written to a database using
[`df_to_sql`](https://ald0405.github.io/SangerTools/reference/df_to_sql.md).
Alternatively, if you are interested in seeing the effects of age
confounding; consider joining the outputs of this function with the
output from
[`crude_rates`](https://ald0405.github.io/SangerTools/reference/crude_rates.md)
using a
[`left_join`](https://dplyr.tidyverse.org/reference/mutate-joins.html)

## Usage

``` r
standardised_rates_df(
  df,
  Split_by,
  Condition,
  Population_Standard,
  Granular = FALSE,
  ...
)
```

## Arguments

- df:

  a tidy data frame in standard Master Patient Index format ie
  SangerTools::PopHealthData.

- Split_by:

  A column name within df for which the standardised rates will be
  calculated for.

- Condition:

  A Health condition flag denoted by 1 & 0; where 1 denotes the patient
  being positive for the health condition.

- Population_Standard:

  Population Standard Weight used for Standardising; default set to
  NULL; which denotes use of Age Structure of df.

- Granular:

  Takes a boolean value. If set to TRUE will output a tibble with
  Standardised Rates using values provided in \`Split_col\` and
  \`...\`By default is set to FALSE.

- ...:

  Variables used to standardise by; Must always have Age band for age
  standardisation, additional variables are optional and should be
  passed separated by commas.

## Value

A tibble containing standardised Prevalence Rates by specified group.

## Examples

``` r
library(SangerTools)
health_data <- SangerTools::age_bandizer(df = SangerTools::master_patient_index,
                                         Age_col=Age)
df_rates <- standardised_rates_df(
  df = health_data,
  Split_by = Locality,
  Condition = Diabetes,
  Population_Standard = NULL,
  Granular = TRUE,
  Ageband
)
#> Joining with `by = join_by(Locality, Ageband)`
#> Joining with `by = join_by(Ageband)`
print(df_rates)
#> # A tibble: 141 × 3
#>    Locality                 Ageband Standardised_Rate_1k
#>    <chr>                    <fct>                  <dbl>
#>  1 North Cotswolds          65-69                  12.3 
#>  2 North Cotswolds          20-24                   8.14
#>  3 South Cotswolds          70-74                   6.41
#>  4 The Forest of Dean       40-44                   6.16
#>  5 The Forest of Dean       65-69                   5.96
#>  6 The Forest of Dean       55-59                   5.90
#>  7 The Forest of Dean       60-64                   5.49
#>  8 Stroud and Berkeley Vale 25-29                   5.47
#>  9 Stroud and Berkeley Vale 60-64                   5.45
#> 10 The Forest of Dean       25-29                   5.23
#> # ℹ 131 more rows
```
