% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_sanger.R
\name{theme_sanger}
\alias{theme_sanger}
\title{Customised ggplot2 Theme}
\usage{
theme_sanger()
}
\value{
A customised ggplot2 plot
}
\description{
A customised ggplot2 theme for the SangerTools package
}
\examples{
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
}
