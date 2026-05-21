# SangerTools - Tools for working with Population Health datasets

[![](reference/figures/sangertoolshex.png)](https://hutsons-hacks.info/)

## Background

Sanger Tools was born out of necessity.

It is the formal aggregation of a set of coding solutions employed
regularly to carry out Population Health Management Analytics; rapidly
and consistently. It has has been created specifically for
Gloucestershire CCG and wider National Health Service (NHS) staff
working with patient level population health data.

However, we hope Sanger Tools aids analytical workers around to world
who work with similar datasets.

Currently this will be best suited to CCG and CSU staff.

If you are using this package outside of the NHS we would be very keen
to hear from you!

The package draws its name from Sanger House; the office in which NHS
Gloucestershire CCG’s analytical team are based.

## Package Aims

The tools in this package have been created to assist in every-day tasks
undertaken by most NHS analysts. Functions have been created to provide
an easy-to-use interface for common tasks where analysts are working
between R, SQL and Excel. Many of the functions are created to work with
datasets which contain 1 Row Per Patient in tidy data format; where each
row is an observation and columns are variables pertaining to the
patient. This format is commonly seen across the NHS; often referred to
as Master Patient Index (MPI).

## API Notes

Many of the functions are written in Tidyverse; as such there will be
performance limitations on larger datasets. Please take care to read to
the documentation and included examples as the functions in this package
use a combination of Standard Evalutation (Base R) and [Non-Standard
Evalutation](https://dplyr.tidyverse.org/articles/programming.html)
(Tidyverse).

## Installing the package from GitHub

You can install the package using the following commands

``` r

# install.packages("remotes") # if not already installed

remotes::install_github("ald0405/SangerTools")

library(SangerTools)
```

## Installing the package from CRAN

``` r

# install.packages("SangerTools")

library(SangerTools)
```

## Learning how to use the package

- Full reference and articles: <https://ald0405.github.io/SangerTools/>
- Original RPubs walk-through: <https://rpubs.com/thesiff/sangertools2>
- Demo notebook (data + every function), rendered for GitHub:
  [`notebooks/demo-data-and-functions.md`](https://ald0405.github.io/SangerTools/notebooks/demo-data-and-functions.md)
- Same notebook as a package vignette:
  [`vignette("demo-data-and-functions", package = "SangerTools")`](https://ald0405.github.io/SangerTools/articles/demo-data-and-functions.md)

## Contributors and Authors

[![Asif](https://i.stack.imgur.com/gVE0j.png)
Asif](https://www.linkedin.com/in/asiflaldin/) - Analytics Consultant &
NHS-R Fellow

[![Gary](https://i.stack.imgur.com/gVE0j.png)
Gary](https://www.linkedin.com/in/ghutson/) - Head of Machine Learning
and Senior NHS-R Fellow
