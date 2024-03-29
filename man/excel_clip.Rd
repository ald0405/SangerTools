% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/excel_clip.R
\name{excel_clip}
\alias{excel_clip}
\title{Dataframe or Tibble to Clipboard}
\usage{
excel_clip(df, row_names = FALSE, col_names = TRUE, ...)
}
\arguments{
\item{df}{A dataframe or tibble}

\item{row_names}{Set to FALSE for row.names not to be included}

\item{col_names}{Set to TRUE for col.names to be included}

\item{...}{function forwarding for additional write.table functionality}
}
\value{
a data frame copied to your clipboard
}
\description{
This function copies a data frame or tibble to your clipboard in a format that allows
for a simple paste into excel whilst maintaining column and row structure.
By default row_names has been set to FALSE.
}
