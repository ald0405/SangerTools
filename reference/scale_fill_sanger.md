# Branded discrete colour scale

This anonymous function allows you to apply the Sanger Theme colours to
your ggplot2 plot

## Usage

``` r
scale_fill_sanger()
```

## Value

A custom colour filled ggplot2 plot

## Examples

``` r
library(SangerTools)
library(dplyr)
library(ggplot2)
# Group by Age Band
health_data <- SangerTools::PopHealthData
health_data %>%
  dplyr::filter(Smoker == 1) %>%
  SangerTools::categorical_col_chart(AgeBand) +
  labs(
    title = "Smoking Population by Age Band",
    subtitle = "Majority of Smokers are Working Aged ",
    x = NULL,
    y = "Patient Number"
  )+
  scale_fill_sanger()
```
