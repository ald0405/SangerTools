# Crude Prevalence Calculator

Calculate the crude prevalence of a health condition from a Master
Patient Index like dataset

## Usage

``` r
crude_rates(df, Condition, ...)
```

## Arguments

- df:

  a tidy dataframe in standard Master Patient Index format ie
  SangerTools::PopHealthData

- Condition:

  A Health condition flag denoted by 1 & 0; where 1 denotes the patient
  being positive for the health condition

- ...:

  Variables used to standardise by; Must always have Ageband, additional
  variables are optional

## Value

a tibble with Crude Prevalence Rates(Rate per 1,000) for each value
included in ...

## Examples

``` r
library(SangerTools)
library(dplyr)
health_data <- SangerTools::PopHealthData
glimpse(health_data)
#> Rows: 1,000
#> Columns: 8
#> $ Sex                <chr> "Male", "Female", "Male", "Male", "Male", "Female",…
#> $ Smoker             <dbl> 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ Diabetes           <dbl> 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, …
#> $ AgeBand            <chr> "Children and Young People (0-17)", "Working Age Ad…
#> $ IMD_Decile         <dbl> 9, 5, 3, 3, 4, 6, 3, 7, 6, 4, 9, 2, 1, 9, 2, 3, 4, …
#> $ Ethnicity          <chr> "White", "White", "White", "White", "White", "White…
#> $ Locality           <chr> "Cheltenham", "Gloucester City", "Cheltenham", "Glo…
#> $ PrimaryCareNetwork <chr> "Cheltenham Central", "Tewkesbury, Newent and Staun…
# Generate crude prevalene rate stats
crude_prevalence <- SangerTools::crude_rates(health_data, Diabetes, Locality)
#> Joining with `by = join_by(Locality)`
print(crude_prevalence)
#> # A tibble: 7 × 4
#>   Locality                       Cohort_Size Diabetes_Population Prevalence_1k
#>   <chr>                                <int>               <int>         <dbl>
#> 1 Cheltenham                             249                  15          60.2
#> 2 Gloucester City                        272                  15          55.1
#> 3 South Cotswolds                         98                   5          51.0
#> 4 The Forest of Dean                      81                   4          49.4
#> 5 Tewkesbury Newent and Staunton          64                   2          31.2
#> 6 Stroud and Berkeley Vale               187                   5          26.7
#> 7 North Cotswolds                         49                   1          20.4
```
