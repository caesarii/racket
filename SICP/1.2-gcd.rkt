#lang racket

; GCD(a, b) = GCD(b, r)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 4 8)