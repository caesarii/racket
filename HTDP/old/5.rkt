#lang racket

; (symbol? 'hello)
; (eq? 'hello 'hello)

(define (reply s)
  (cond
    [(eq? s "Good Morning") "Hi"]
    [(eq? s "How Are You?") "Fine"]
    [else "Yes"]))
