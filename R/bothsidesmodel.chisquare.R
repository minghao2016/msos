
#' Test subsets of \eqn{\beta} are zero
#'
#' Tests the null hypothesis that an arbitrary subset of the \eqn{\beta _{ij}}'s
#' is zero, based on the least squares estimates, using the \eqn{\chi^2} test as
#' in Section 7.1. The null and alternative are specified by pattern matrices
#' \eqn{P_0} and \eqn{P_A}, respectively. If the \eqn{P_A} is omitted, then the
#' alternative will be taken to be the unrestricted model.
#'
#' @param x        An \eqn{N \times P}{N x P} design matrix.
#' @param y        The \eqn{N \times Q}{N x Q} matrix of observations.
#' @param z        A \eqn{Q \times L}{Q x L} design matrix.
#' @param pattern0 An \eqn{N \times P}{N x P} matrix of 0's and 1's specifying
#'                 the null hypothesis.
#' @param patternA An optional \eqn{N \times P}{N x P} matrix of 0's and 1's
#'                 specifying the alternative hypothesis.
#'
#' @return
#' A `list` with the following components:
#'
#' \describe{
#'   \item{Theta}{The vector of estimated parameters of interest.}
#'   \item{Covtheta}{The estimated covariance matrix of the estimated parameter vector.}
#'   \item{df}{The degrees of freedom in the test.}
#'   \item{chisq}{\eqn{T^2} statistic in (7.4).}
#'   \item{pvalue}{The p-value for the test.}
#' }
#'
#' @seealso \code{\link{bothsidesmodel}}, \code{\link{bothsidesmodel.df}},
#'          \code{\link{bothsidesmodel.hotelling}}, \code{\link{bothsidesmodel.lrt}},
#'          and \code{\link{bothsidesmodel.mle}}.
#' @examples
#' # TBA - Submit a PR!
#' @export
bothsidesmodel.chisquare <-
  function(x, y, z, pattern0, patternA = matrix(1, nrow = ncol(x), ncol = ncol(z))) {
    bsm <- bothsidesmodel(x, y, z, patternA)
    which <- patternA * (1 - pattern0)
    which <- c(t(which)) == 1
    theta <- c(t(bsm$Beta))[which]
    covtheta <- bsm$Covbeta[which, which]
    chisq <- theta %*% solve(covtheta, theta)
    df <- sum(which)
    list(Theta = theta, Covtheta = covtheta, df = df, Chisq = chisq, pvalue = 1 - pchisq(chisq, df))
  }
