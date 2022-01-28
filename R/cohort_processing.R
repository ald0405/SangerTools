#'  Patient Cohort Re-Identification Processing
#' @description
#' Population Health Management commonly leads practitioners to identify a cohort that will have an intervention applied.
#' As a rule of thumb most analysts will work with pseudonymised data sets. For targeted interventions patients require re-identification;
#' this process is generally carried out by a third party organisation. As third party organisations work with many health care providers they have a strict set of
#' requirements. This has been based around SW CSU's required formatting.
#' @param df a tidy dataframe in standard Master Patient Index format ie SangerTools::PopHealthData.
#' @param Split_by A column within df that will be used to split the patients and will also appear in the file name. Ideally should be a health organisation code such as GP Practice Code or Hospital Trust Code. Should only have alpha-numeric values
#' @param path A file path to which the CSV files will be written
#' @param prefix File name prefix, default is "DSCRO" See more here: https://digital.nhs.uk/about-nhs-digital/our-work/keeping-patient-data-safe/gdpr/gdpr-register/data-services-for-commissioners-regional-offices-dscro-gdpr-information/data-services-for-commissioners-regional-offices-dscro-ambulance
#' @param com_code Commissioner Code, default is "11M"; Gloucestershire.
#' @param date_format A date format passed internally to `format(Sys.Date())`; will form part of file name to denote date of generation.
#' @param suffix A file name suffix, default is "_REID_V01", To be left as blank use "", without spaces.
#' @return n number of CSV files written to the location specified by path argument.
#' @importFrom readr write_csv
#'
cohort_processing <- function(df,Split_by,path,prefix = "DSCRO",com_code = "11M",date_format = "%Y%m%d",suffix = "_REID_V01") {

  # Split Dataframe by Organisational Identifier
  final <- split(df, df[Split_by])

  # Iterate through each item of the list & write file
  lapply(
    final,
    function(x) {
      write_csv(
        x,
        paste0(
          path, prefix, "_",
          com_code, "_",
          unique(x[Split_by]), "_",
          format(Sys.Date(), date_format), suffix, ".csv"
        )
      )
    }
  )
}
