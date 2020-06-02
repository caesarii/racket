#lang racket
(define (condition n)
  (cond [(< n 10) "n < 10"]
        [(< n 20) "10 < n < 20"]
        [(< n 30) "20 < n < 30"]
        [else "else"]))

(condition 55)