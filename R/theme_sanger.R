#' @title
#' Sleek, minimal ggplot2 theme for SangerTools
#' @description
#' A clean light theme inspired by NHS Identity guidelines and the visual
#' language of modern wearables (Whoop, Withings): generous whitespace,
#' subtle horizontal gridlines only, no axis ticks or chartjunk, and a
#' strong navy heading colour drawn from the NHS palette.
#' @param base_size Base font size in points. Defaults to 12.
#' @param base_family Base font family. Defaults to "" (system default).
#' @return A ggplot2 theme object that can be added to any ggplot2 plot.
#' @importFrom ggplot2 theme_minimal theme element_blank element_rect
#' @importFrom ggplot2 element_text element_line margin rel
#' @importFrom ggtext element_markdown
#' @examples
#' library(SangerTools)
#' library(ggplot2)
#' categorical_col_chart(SangerTools::PopHealthData, Locality) +
#'   labs(
#'     title = "Patients by locality",
#'     subtitle = "Fabricated Gloucestershire CCG data",
#'     x = NULL,
#'     y = "Patients"
#'   ) +
#'   theme_sanger() +
#'   scale_fill_sanger()
#' @export
theme_sanger <- function(base_size = 12, base_family = "") {
  ink         <- "#231F20"   # NHS Black
  ink_strong  <- "#003087"   # NHS Dark Blue
  ink_muted   <- "#425563"   # NHS Dark Grey
  ink_subtle  <- "#768692"   # NHS Mid Grey
  rule        <- "#E8EDEE"   # NHS Pale Grey
  surface     <- "#FFFFFF"

  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # Surfaces
      plot.background   = element_rect(fill = surface, colour = NA),
      panel.background  = element_rect(fill = surface, colour = NA),
      panel.border      = element_blank(),

      # Gridlines: horizontal only, hairline weight
      panel.grid.major.x = element_blank(),
      panel.grid.minor   = element_blank(),
      panel.grid.major.y = element_line(colour = rule, linewidth = 0.4),

      # Typography
      plot.title = element_markdown(
        colour = ink_strong, face = "bold", size = rel(1.45),
        margin = margin(b = 6)
      ),
      plot.subtitle = element_markdown(
        colour = ink_muted, size = rel(1.05),
        margin = margin(b = 12)
      ),
      plot.caption = element_markdown(
        colour = ink_subtle, size = rel(0.8), hjust = 0,
        margin = margin(t = 10)
      ),
      plot.title.position   = "plot",
      plot.caption.position = "plot",
      plot.margin           = margin(t = 16, r = 18, b = 12, l = 14),

      # Axes
      axis.title.x = element_text(colour = ink_muted, size = rel(0.95),
                                  margin = margin(t = 8)),
      axis.title.y = element_text(colour = ink_muted, size = rel(0.95),
                                  margin = margin(r = 8)),
      axis.text    = element_text(colour = ink_muted, size = rel(0.85)),
      axis.line.x  = element_line(colour = rule, linewidth = 0.4),
      axis.line.y  = element_blank(),
      axis.ticks   = element_blank(),

      # Facets
      strip.text       = element_text(colour = ink_strong, face = "bold",
                                      size = rel(0.95)),
      strip.background = element_rect(fill = "#F4F6F8", colour = NA),

      # Legend
      legend.position    = "top",
      legend.justification = "left",
      legend.title       = element_text(colour = ink_muted, size = rel(0.85)),
      legend.text        = element_text(colour = ink_muted, size = rel(0.85)),
      legend.background  = element_blank(),
      legend.key         = element_blank(),

      # Base text colour
      text = element_text(colour = ink)
    )
}
