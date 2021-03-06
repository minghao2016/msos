% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pcbic.R
\name{pcbic}
\alias{pcbic}
\title{BIC for a particular pattern}
\usage{
pcbic(eigenvals, n, pattern)
}
\arguments{
\item{eigenvals}{The \eqn{Q}-vector of eigenvalues of the covariance matrix,
in order from largest to smallest.}

\item{n}{The degrees of freedom in the covariance matrix.}

\item{pattern}{The pattern of equalities of the eigenvalues, given by the
\eqn{K}-vector (\eqn{Q_1}, ... , \eqn{Q_K}) as in (13.8).}
}
\value{
A `list` with the following components:
\describe{
 \item{lambdaHat}{A \eqn{Q}-vector containing the MLE's for the eigenvalues.}
 \item{Deviance}{The deviance of the model, as in (13.13).}
 \item{Dimension}{The dimension of the model, as in (13.12).}
 \item{BIC}{The value of the BIC for the model, as in (13.14).}
}
}
\description{
Find the BIC and MLE from a set of observed eigenvalues for a specific pattern.
}
\examples{
# Build cars1
require("mclust")
mcars <- Mclust(cars)
cars1 <- cars[mcars$classification == 1, ]
xcars <- scale(cars1)
eg <- eigen(var(xcars))
pcbic(eg$values, 95, c(1, 1, 3, 3, 2, 1))
}
\seealso{
\code{\link{pcbic.stepwise}}, \code{\link{pcbic.unite}},
         and \code{\link{pcbic.subpatterns}}.
}
