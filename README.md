# SangerTools - Tools for working with Population Health datasets

<p><a href="https://hutsons-hacks.info/"><img src = "man/figures/sangertoolshex.png" width = "125px" height = "150px" align="right"></a></p>

 <!-- badges: start -->
  [![R-CMD-check](https://github.com/ald0405/SangerTools/workflows/R-CMD-check/badge.svg)](https://github.com/ald0405/SangerTools/actions)
![GitHub last commit](https://img.shields.io/github/last-commit/ald0405/SangerTools)
![GitHub Repo stars](https://img.shields.io/github/stars/ald0405/SangerTools?label=SangerToolsR%20Stars)
 [![CRAN status](https://www.r-pkg.org/badges/version/ConfusionTableR)](https://CRAN.R-project.org/package=SangerTools) 
 [![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/SangerTools)](https://cran.r-project.org/package=SangerTools)
 
  <!-- badges: end -->

## Package Aims 

Sanger Tools has been created for the UK's National Health Service (NHS) analytical workforce. However, we hope Sanger Tools aids analytical workers around to world who work with similar datasets. 
The tools in this package have been created to efficiently analyse and navigate datasets which contain patient level data. Ie 1 Row per patient; in tidy data format; where each row is an observation and columns are variables.  This format is commonly seeing across the NHS being referred to a Master Patient Index (MPI)
The functions and included examples are created to mimic data found at NHS Gloucestershire CCG. Many of the functions are written in Tidyverse.

## Vignette
The dataset included is random dataset generated based on proportions from Gloucestershire County; <a href="https://www.rpubs.com/StatsGary/851661">see vignette</a> 
The vignette on how to use the package is available .

We hope this package aids those working with 
* Patient Level Data
* Population Health Management
* Patient Cohorting 

SangerTools is still under construction, and we will be releasing updates in Q1 2022


## Installing the package from GitHub

Here, I will use the package remotes to install the package:

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

## We are trending

Check out the statistics of the repo below:

[![GitHub stats](https://github-readme-stats.vercel.app/api?username=ald0405)](https://github.com/anuraghazra/github-readme-stats)

## Contributors and Authors
[![Asif](https://i.stack.imgur.com/gVE0j.png) Asif](https://www.linkedin.com/in/asiflaldin/) - Consultant working with clinical commissioning groups

[![Gary](https://i.stack.imgur.com/gVE0j.png) Gary](https://www.linkedin.com/in/ghutson/) - Head of Machine Learning and Senior NHS-R Fellow
