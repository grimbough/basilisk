#' Use the Bioconductor Python
#'
#' Use \pkg{reticulate} to set up the Bioconductor-owned instance of Python provided by \pkg{basilisk}.
#'
#' @return
#' A string containing the path to the \pkg{basilisk} Python executable, invisibly.
#'
#' @author Aaron Lun
#'
#' @details
#' This function is intended for use within other Bioconductor packages.
#' It uses \code{\link{use_python}} to register a consistent Python version that is isolated from the system installation.
#' 
#' @examples
#' useBiocPython()
#' os <- reticulate::import("os")
#' os$listdir()
#'
#' @export
#' @importFrom reticulate use_python
useBiocPython <- function() {
    use_python(system.file("inst", "python", "bin", "python3", package="basilisk", mustWork=TRUE), required=TRUE)
}
