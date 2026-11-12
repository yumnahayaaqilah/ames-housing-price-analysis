# Render the analysis report to HTML and PDF.
# Run from the repository root:  Rscript render.R
#
# Outputs:
#   reports/ames_housing_analysis.html
#   reports/ames_housing_analysis.pdf
#   figures/*.png   (written by the report's last chunk, used in README.md)

rmd <- file.path("analysis", "ames_housing_analysis.Rmd")
if (!file.exists(rmd)) {
  stop("analysis/ames_housing_analysis.Rmd not found. Run this script from the repository root.")
}

dir.create("reports", showWarnings = FALSE)
dir.create("figures", showWarnings = FALSE)

rmarkdown::render(
  input         = rmd,
  output_format = c("html_document", "pdf_document"),
  output_dir    = "reports",
  envir         = new.env()
)
