% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/useVirtualEnv.R
\name{setupVirtualEnv}
\alias{setupVirtualEnv}
\title{Set up and use virtual environments}
\usage{
setupVirtualEnv(envname, packages, pkgname = NULL)
}
\arguments{
\item{envname}{String containing the name of the virtual environment to create (for \code{setupVirtualEnv}) or use (other functions).}

\item{packages}{Character vector containing the names of Python packages to install into the virtual environment.
It is strongly recommended to include version numbers in each name.}

\item{pkgname}{String specifying the package name, if these functions are being used inside an R package.}

\item{FUN}{A function to execute in the context of the virtual environment.
Any calls to non-base functions within \code{FUN} should be prefixed with the namespace.}

\item{...}{Further arguments to pass to \code{FUN} or to \code{\link{r}}.}
}
\value{
\code{setupVirtualEnv} will return the output of \code{\link{virtualenv_install}}.

\code{useVirtualEnv} will return the output of \code{\link{use_virtualenv}}.

\code{callVirtualEnv} will return the output of \code{FUN}.
}
\description{
Set up and use Python virtual environments for isolated execution of Python code with appropriate versions of all Python packages.
}
\details{
Use of virtual environments is the recommended approach for Bioconductor packages to interact with the \pkg{basilisk} Python instance.
This avoids conflicts when different Bioconductor packages require incompatible versions of Python packages.

Developers of Bioconductor packages should call \code{setupVirtualEnv} with an appropriate \code{pkgname} in an \code{configure} script,
to install the relevant Python packages during R package installation process.
Then, functions can simply call \code{callVirtualEnv} to take advantage of the installed packages.
The \pkg{son.of.basilisk} example in the \code{inst} directory of \pkg{basilisk} can be used as an example.
}
\section{Running Python code}{

The \code{callVirtualEnv} function allows multiple virtual environments to be used by different R packages in a single R session.
This is done by creating an isolated R process with the \pkg{callr} package and loading the requested virtual environment in that session.
Thus, we avoid a limitation of \pkg{reticulate} where an R session is irrevocably tied to a version of Python and/or modules.

Writers of \code{FUN} can assume that the virtual environment specified by \code{envname} has already been loaded.
This means that \code{\link{import}} and related functions will work correctly, though developers should namespace the calls with \code{reticulate::}.
The same namespacing process applies for any other non-base functions that are used within \code{FUN}.
}

\section{Python package version control}{

When calling \code{setupVirtualEnv} during R package installation, it is strongly recommended to have version numbers in \code{packages}.
This makes debugging much easier when the R package is installed and executed on different systems.
If version numbers are not provided for any package, we will use a version number selected by \code{\link{findVersionUpTo}}. 

The nature of Python package management means that conflicts can arise if two Python packages have mutually incompatible dependencies.
This is best handled by setting up separate virtual environments for these packages and calling them separately.
}

\examples{
setupVirtualEnv('my_package_A', 'pandas==0.25.1')
setupVirtualEnv('my_package_B', 'pandas==0.24.0')

callVirtualEnv("my_package_A", FUN=reticulate::py_config)
callVirtualEnv("my_package_B", FUN=reticulate::py_config)

}
\author{
Aaron Lun
}
