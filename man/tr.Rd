% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tr.R
\name{tr}
\alias{tr}
\title{Trace of a Matrix}
\usage{
tr(x)
}
\arguments{
\item{x}{Square matrix (\eqn{Q \times Q}{Q x Q})}
}
\value{
Returns a single-value double.
}
\description{
Takes the traces of a matrix by extracting the diagonal entries and then
summing over.
}
\examples{

# Identity Matrix of size 4, gives trace of 4.
tr(diag(4))
}
\seealso{
\code{\link{logdet}}, \code{\link{fillout}}
}
