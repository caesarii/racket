#lang racket

; is-5?
(define (is-5? n)
  (= n 5))
(is-5? 5)

; is-between-5-6?
(define (is-between-5-6? n)
  (and (> n 5) (< n 6)))
(is-between-5-6? 5.5)

; is-bewteen-56-over10?
(define (is-bewteen-56-over10? n)
  (or (is-between-5-6? n) (> n 10)))
(is-bewteen-56-over10? 11)

; equation1
(define (equation1 x)
  (= (+ (* x x) (+ (* 2 x) 0))))
(equation1 1)