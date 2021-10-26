test_that("greedy algorithm works", {
  set.seed(42)
  n <- 2000
  knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE), v <- runif(n = n, 0, 10000))

  sack <- greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
  expect_equal(sack$value, 195851)
  expect_equal(sack$elements, c(256, 530, 701, 559, 89, 75, 759, 626, 219, 244, 63, 672, 455, 764, 329, 77, 705, 320, 110, 509, 762, 729, 691, 283, 553, 620, 341, 187, 83, 707, 511, 322))

  sack <- greedy_knapsack(x = knapsack_objects[1:1200,], W = 2000)
  expect_equal(sack$value, 185278)
  expect_equal(sack$elements, c(256,  530, 1186,  951,  701, 1157,  973,  559, 1019,   89,   75,  759,  845, 1153,  626,  897, 1106,  219, 1065, 1070,  244, 1036,  63,  672,  455,  826,  764,  981,  329,   77,  320,  110))
})
