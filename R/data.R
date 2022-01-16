#' @title PopHealthData - Population health data for testing functions
#' @description Population Health NHS data to use with the package and allows the calculation of the various metrics.
#' @format A small dataset with 1000 observations (rows) and 8 columns, as described hereunder:
#'  \describe{
#'   \item{Sex}{The identifiable sex of the patient}
#'   \item{Smoker}{Indicates if the patient is a smoker}
#'   \item{Diabetes}{Flag to indicate if patient has a type of diabetes}
#'   \item{AgeBand}{The age of the patient when they came into contact with the service}
#'   \item{IMD_Decile}{The decile of indices of multiple deprivation: \url{https://www.gov.uk/government/statistics/english-indices-of-deprivation-2019}}
#'   \item{Ethnicity}{The identifiable ethnicity of the patient}
#'   \item{Locality}{The region of the patient lives - sampled from Gloucestershire Clinical Commissioning Group}
#'   \item{PrimaryCareNetwork}{The primary care network of the patient}
#'  }
"PopHealthData"
