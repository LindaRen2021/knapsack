#' @importFrom dplyr filter
#' @importFrom utils head
NULL

#' Knapsack problem solver with brute force algorithm
#'
#' @param x data frame of weights (first column) and value (second column)
#' @param W Maximum capacity (numeric)
#'
#' @return Return the maximum value and elements (index of values) and weight
#' @export
#'
#' @examples
#' set.seed(42)
#' n <- 2000
#' knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE),
#'     v <- runif(n = n, 0, 10000))
#' brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
brute_force_knapsack <- function(x, W) {
  ptm <- proc.time()


  ## Optimization attempt 1
  # Make data frame smaller by removing impossible candidates
  # this saves significant time on anything but the smallest of data frames

  # Save original index as value in data frame
  x_ind <- cbind(x, ind = 1:nrow(x))
  x_opt <- dplyr::filter(x_ind, x_ind$w <= W)

  n <- nrow(x_opt)
  binRep <- lapply(1:(2^n), function(v) head(as.integer(intToBits(v), n), n))

  elements <- c()
  value <- 0
  weight <- 0
  for (i in 1:length(binRep)) {
    inds <- c()
    for (j in 1:n) {
      if (binRep[[i]][j] == 1) {
        inds <- c(inds, j)
      }
    }
    wgt <- sum(x_opt$w[inds])
    val <- sum(x_opt$v[inds])

    if (wgt <= W && val > value) {
      # Use original indices for elements, saved in data frame above
      elements <- x_opt$ind[inds]
      value <- val
      weight <- wgt
    }
  }
  t <- proc.time() - ptm
  result <- list(value = round(value, digits = 0), elements = elements, weight = weight, time = t)
  return (result)
}
