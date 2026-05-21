# Patient Cohort Re-Identification Processing

Population Health Management commonly leads practitioners to identify a
cohort that will have an intervention applied. As a rule of thumb most
analysts will work with pseudonymised data sets. For targeted
interventions patients require re-identification; this process is
generally carried out by a third party organisation. As third party
organisations work with many health care providers they have a strict
set of requirements. This has been based around SW CSU's required
formatting.

## Usage

``` r
cohort_processing(
  df,
  Split_by,
  path,
  prefix = "DSCRO",
  com_code = "11M",
  date_format = "%Y%m%d",
  suffix = "_REID_V01"
)
```

## Arguments

- df:

  a tidy dataframe in standard Master Patient Index format ie
  SangerTools::PopHealthData.

- Split_by:

  A column within df that will be used to split the patients and will
  also appear in the file name. Ideally should be a health organisation
  code such as GP Practice Code or Hospital Trust Code. Should only have
  alpha-numeric values

- path:

  A file path to which the CSV files will be written

- prefix:

  File name prefix, default is "DSCRO" See more here: [NHS
  DSCRO](https://digital.nhs.uk/about-nhs-digital/our-work/keeping-patient-data-safe/gdpr/gdpr-register/data-services-for-commissioners-regional-offices-dscro-gdpr-information/data-services-for-commissioners-regional-offices-dscro-ambulance)

- com_code:

  Commissioner Code, default is "11M"; Gloucestershire.

- date_format:

  A date format passed internally to \`format(Sys.Date())\`; will form
  part of file name to denote date of generation. You can read more
  about date formatting in R [from R
  lang](https://r-lang.com/r-date-format/)

- suffix:

  A file name suffix, default is "\_REID_V01", To be left as blank use
  "", without spaces.

## Value

n number of CSV files written to the location specified by path
argument.
