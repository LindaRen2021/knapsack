#' @importFrom dplyr filter
NULL

#' Knapsack problem solver with greedy algorithm
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
#' greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
greedy_knapsack<-function(x, W) {
  ptm <- proc.time()

  ##ratio of value and weights
  ratio <- x[,2] / x[,1]

  ##combine the data frame with ratio and the original indices
  x_with_ratio <- cbind(x, ratio = ratio, ind = 1:nrow(x))

  ## Optimization attempt 1
  # Filtering is somewhat expensive, so it is not clear that removing impossible candidates
  # saves time despite making both sorting and looping below faster. To gauge how effective
  # this could be it is possible to check how small W is compared to max(x$w); if the difference
  # is large filtering will be able to remove a big portion of the elements, making optmization
  # worthwhile.
  if (max(x$w) / W >= 2) {
    x_opt <- dplyr::filter(x_with_ratio, w <= W)
    x_sort <- x_opt[order(-x_opt$ratio),]
  } else {
    x_sort <- x_with_ratio[order(-x_with_ratio$ratio),]
  }

  elements <- c()
  value <- 0
  weight <- 0

  ## Optimization attempt 2
  min_w <- min(x_sort$w)

  for (i in 1:nrow(x_sort)) {
    w <- weight + x_sort$w[i]
    if (w <= W) {
      weight <- w
      value <- value + x_sort$v[i]
      elements <- c(elements, x_sort$ind[i])
    }
    ## Optimization attempt 2
    # If no more possible candidates, we're done (for large data frames, this saves significant time)
    if (weight + min_w > W) break()
  }

  t <- proc.time() - ptm
  result <- list(value = round(value, digits = 0), elements = elements, weight = weight, time = t)
  return (result)
}
