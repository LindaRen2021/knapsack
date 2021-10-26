
<!-- README.md is generated from README.Rmd. Please edit that file -->

# knapsack

<!-- badges: start -->
<!-- badges: end -->

The knapsack problem is a discrete optimization problem where we have a
knapsack that can take a limited weight W and we want to fill this
knapsack with a number of items *i = 1,…, n*, each with a weight
*w<sub>i</sub>* and a value *v<sub>i</sub>*. The goal is to find the
knapsack with the largest value of the elements added to the knapsack.  
This problem is NP-hard, meaning that it is ”at least as hard as the
hardest problem in [NP](https://en.wikipedia.org/wiki/NP-hardness)”. NP
is a (fundamental) class of problems for which there are (currently) no
polynomial time algorithms to solve them. It is an open (Millennium
Prize) problem, whether it is or is not possible to solve these problems
in polynomial time. For a more detailed background of the knapsack
problem see [this page](https://en.wikipedia.org/wiki/Knapsack_problem).

## Installation

You can install the development version of knapsack like so:

``` r
install.packages("devtools")
library(devtools)
install_github("LindaRenJonsson/knapsack")
```

## Examples

### brute_force_knapsack

``` r
library(knapsack)

set.seed(42)
n <- 2000
knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE), v <- runif(n = n, 0, 10000))
brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500)
#> $value
#> [1] 17277
#> 
#> $elements
#> [1] 4 5 7
#> 
#> $weight
#> [1] 2984
#> 
#> $time
#>    user  system elapsed 
#>   0.012   0.000   0.013
```

### greedy_knapsack

``` r
set.seed(42)
n <- 2000
knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE), v <- runif(n = n, 0, 10000))
greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
#> $value
#> [1] 195851
#> 
#> $elements
#>  [1] 256 530 701 559  89  75 759 626 219 244  63 672 455 764 329  77 705 320 110
#> [20] 509 762 729 691 283 553 620 341 187  83 707 511 322
#> 
#> $weight
#> [1] 3481
#> 
#> $time
#>    user  system elapsed 
#>   0.002   0.000   0.002
```

#### NOTE about assignment

Do ***note*** that the assignment gives answers for the
`greedy_knapsack` that are not correct. This is easy to show using code:

``` r
set.seed(42)
n <- 2000
knapsack_objects <- data.frame(w = sample(1:4000, size = n, replace = TRUE),
v <- runif(n = n, 0, 10000))

# greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)

# Correct answers
# Value:
sum(knapsack_objects$v[c(256, 530, 701, 559,  89,  75, 759, 626, 219, 244,  63, 672, 455, 764, 329,  77, 705, 320, 110, 509, 762, 729, 691, 283, 553, 620, 341, 187,  83, 707, 511, 322)])
#> [1] 195850.8

# Weight:
sum(knapsack_objects$w[c(256, 530, 701, 559,  89,  75, 759, 626, 219, 244,  63, 672, 455, 764, 329,  77, 705, 320, 110, 509, 762, 729, 691, 283, 553, 620, 341, 187,  83, 707, 511, 322)])
#> [1] 3481


# Given answer is missing element on index 322
# Value:
sum(knapsack_objects$v[c(256, 530, 701, 559,  89,  75, 759, 626, 219, 244,  63, 672, 455, 764, 329,  77, 705, 320, 110, 509, 762, 729, 691, 283, 553, 620, 341, 187,  83, 707, 511)])
#> [1] 190943.8

# Weight: 
sum(knapsack_objects$w[c(256, 530, 701, 559,  89,  75, 759, 626, 219, 244,  63, 672, 455, 764, 329,  77, 705, 320, 110, 509, 762, 729, 691, 283, 553, 620, 341, 187,  83, 707, 511)])
#> [1] 3325


# greedy_knapsack(x = knapsack_objects[1:1200,], W = 2000)

# Correct answers

# Value:
sum(knapsack_objects$v[c(256,  530, 1186,  951,  701, 1157,  973,  559, 1019,   89,   75,  759,  845, 1153,  626,  897, 1106,  219, 1065, 1070,  244, 1036,  63,  672,  455,  826,  764,  981,  329,   77,  320,  110)])
#> [1] 185277.7

# Weight:
sum(knapsack_objects$w[c(256,  530, 1186,  951,  701, 1157,  973,  559, 1019,   89,   75,  759,  845, 1153,  626,  897, 1106,  219, 1065, 1070,  244, 1036,  63,  672,  455,  826,  764,  981,  329,   77,  320,  110)])
#> [1] 1990


# Given answer is missing elements on indices 320 and 110
# Value:
sum(knapsack_objects$v[c(256,  530, 1186,  951,  701, 1157,  973,  559, 1019,   89,   75,  759,  845, 1153,  626,  897, 1106,  219, 1065, 1070,  244, 1036,  63,  672,  455,  826,  764,  981,  329,   77)])
#> [1] 178120.4

# Weight:
sum(knapsack_objects$w[c(256,  530, 1186,  951,  701, 1157,  973,  559, 1019,   89,   75,  759,  845, 1153,  626,  897, 1106,  219, 1065, 1070,  244, 1036,  63,  672,  455,  826,  764,  981,  329,   77)])
#> [1] 1841
```
