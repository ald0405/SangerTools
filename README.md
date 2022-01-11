# SangerTools - Tools for working with Population Health datasets

<p><a href="https://hutsons-hacks.info/"><img src = "man/figures/sangertoolshex.png" width = "125px" height = "150px" align="right"></a></p>

 <!-- badges: start -->
  [![R-CMD-check](https://github.com/ald0405/SangerTools/workflows/R-CMD-check/badge.svg)](https://github.com/ald0405/SangerTools/actions)
![GitHub last commit](https://img.shields.io/github/last-commit/ald0405/SangerTools)
![GitHub Repo stars](https://img.shields.io/github/stars/ald0405/SangerTools?label=SangerToolsR%20Stars)
 [![CRAN status](https://www.r-pkg.org/badges/version/SangerTools)](https://CRAN.R-project.org/package=SangerTools) 
 [![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/SangerTools)](https://cran.r-project.org/package=SangerTools)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/ald0405/SangerTools/blob/master/LICENSE)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/ald0405/SangerTools?branch=master&svg=true)](https://ci.appveyor.com/project/ald0405/SangerTools)

<!-- badges: end -

<!-- badges: end -->


## Background
Sanger Tools has been created for the UK's National Health Service (NHS) analytical workforce who work with patient level data. 

However, we hope Sanger Tools aids analytical workers around to world who work with similar datasets. 


The package draws its name from Sanger House; the office in which NHS Gloucestershire CCG's analytical team are based. 

## Package Aims 
The tools in this package have been created to efficiently analyse and navigate datasets which contain patient level data. Ie 1 Row per patient; in tidy data format; where each row is an observation and columns are variables.  This format is commonly seeing across the NHS being referred to a Master Patient Index (MPI)
The functions and included examples are created to mimic data found at NHS Gloucestershire CCG. 

Many of the functions are written in Tidyverse; as such there will be performance limitations on larger datasets. 




We hope this package aids those working with 
* Patient Level Data
* Patient Cohorting 
* Data Visulisations

## Further Releases
SangerTools is still under construction and we will be incrementally adding new features with another release to CRAN in Q1 2022.


If you have specific analytical tool needs in the areas of Population Health Management please contact a.laldin@nhs.net 

## Installing the package from GitHub

You can install the package using the following commands

``` r
# install.packages("remotes") # if not already installed
remotes::install_github("https://github.com/ald0405/SangerTools")
library(SangerTools)

```
## Installing the package from CRAN


``` r
# install.packages("SangerTools")
library(SangerTools)

```

## Learning how to use the package

To learn how to use the package, check out the [vignette](https://rpubs.com/StatsGary/851661) on RPubs.

## Contributors and Authors
[![Asif](https://i.stack.imgur.com/gVE0j.png) Asif](https://www.linkedin.com/in/asiflaldin/) - Analytics Consultant working with Clinical Commissioning Groups

[![Gary](https://i.stack.imgur.com/gVE0j.png) Gary](https://www.linkedin.com/in/ghutson/) - Head of Machine Learning and Senior NHS-R Fellow


