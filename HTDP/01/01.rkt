#lang racket

; ex1
(define x 3)
(define y 4)
(sqrt (+ (expt x 2) (expt y 2)))

; ex2
(define prefix "hello")
(define suffix "world")
(string-append prefix " " suffix)

; ex3
(define str "helloworld")
(define i 5)

(string-append (substring str 0 i) "_" (substring str i (string-length str)))

; ex4
(string-append (substring str 0 i) (substring str (+ i 1) (string-length str)))

; ex7
(define sunny #t)
(define friday #f);
(and (eqv? sunny #f) (eqv? friday #t))
