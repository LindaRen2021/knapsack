test_that("brute force algorithm works", {
  set.seed(42)
  n <- 2000
  knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE), v <- runif(n = n, 0, 10000))

  sack <- brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
  expect_equal(sack$value, 17277)
  expect_equal(sack$elements, c(4, 5, 7))

  sack <- brute_force_knapsack(x = knapsack_objects[1:12,], W = 3500)
  expect_equal(sack$value, 19912)
  expect_equal(sack$elements, c(5, 7, 10))
})
