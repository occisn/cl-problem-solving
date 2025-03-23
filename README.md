# cl-problem-solving

Hobby project using Common Lisp to solve numeric puzzles as those proposed by Project Euler. 

## Table of contents

**Project Euler problems:**
[1](#project-euler-001-multiples-of-3-or-5)

## Project Euler 001: Multiples of 3 or 5

_If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000._
[(source)](https://projecteuler.net/problem=1)

``` lisp
(defun project-euler-1 (n)
  "Solve Project Euler 1."
  (loop for i from 1 below n
        when (or (= 0 (mod i 3)) (= 0 (mod i 5)))
          sum i))
```

(end of README)
