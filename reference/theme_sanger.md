# Customised ggplot2 Theme

A customised ggplot2 theme for the SangerTools package

## Usage

``` r
theme_sanger()
```

## Value

A customised ggplot2 plot

## Examples

``` r
library(SangerTools)
library(ggthemes)
library(ggplot2)
library(ggtext)
categorical_col_chart(SangerTools::PopHealthData, Locality) +
  theme_sanger()+
  labs(title = "Categorical Column Chart",
  x = "Locality",
  y = "Number of Patients")+
  scale_fill_sanger()
```
