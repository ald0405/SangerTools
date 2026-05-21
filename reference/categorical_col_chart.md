# Plot Counts of Categorical Variables

Create a ggplot2 column chart of categorical variables with labels, in
ascending order. The plot will be customised using the provided theme
[`theme_sanger`](https://ald0405.github.io/SangerTools/reference/theme_sanger.md),
y-axis labels will have a comma for every third integer value. If the
column provided to \`grouping_var\` has more than approximately 5
values, you may need to consider rotating x axis labels using
[`theme`](https://ggplot2.tidyverse.org/reference/theme.html)

A comprehensive explanation of ggplot2 customisation is available
[here](https://ggplot2.tidyverse.org/reference/)

## Usage

``` r
categorical_col_chart(df, grouping_var)
```

## Arguments

- df:

  A dataframe with categorical variables

- grouping_var:

  a categorical variable by which to group the count by

## Value

a ggplot2 object

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
  )
```
