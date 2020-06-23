#lang racket

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 5)

(define (factorial-iterative n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (>  counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))



(factorial-iterative 6)