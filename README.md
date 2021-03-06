
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

### brute\_force\_knapsack

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
#>    0.02    0.00    0.01
```

### greedy\_knapsack

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
#>       0       0       0
```
