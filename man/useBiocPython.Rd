% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/useBiocPython.R
\name{useBiocPython}
\alias{useBiocPython}
\title{Use the Bioconductor Python}
\usage{
useBiocPython()
}
\value{
A string containing the path to the \pkg{basilisk} Python executable, invisibly.
}
\description{
Use \pkg{reticulate} to set up the Bioconductor-owned instance of Python provided by \pkg{basilisk}.
}
\details{
This function is intended for use within other Bioconductor packages.
It uses \code{\link{use_python}} to register a consistent Python version that is isolated from the system installation.
}
\examples{
useBiocPython()
os <- reticulate::import("os")
os$listdir()

}
\author{
Aaron Lun
}
