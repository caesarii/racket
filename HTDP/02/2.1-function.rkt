#lang racket

; ex11:  (x, y) 到原点的距离
(define (distance-to-origin x y)
  (sqrt (+ (expt x 2) (expt y 2))))
(distance-to-origin 3 4)

; ex12: 立方体体积
(define (cvolume l)
  (expt l 3))
(cvolume 3)

(define (csurface l)
  (* 6 (expt l 2)))
(csurface 3);

; ex13
(define (string-first str)
  (string-ref str 0))

(string-first "abc")

; ex14
(define (string-last str)
  (string-ref str (- (string-length str) 1)))
(string-last "abc")

; ex15
(define (sunny-friday sunny friday)
  (and (eqv? sunny #t) (eqv? friday  #f)))

(sunny-friday #t #f)

; ex18
(define (string-join str1 str2)
  (string-append str1 "_" str2))
(string-join "hello" "world")

; ex19
(define (string-insert str i)
  (string-append (substring str 0 i) "_" (substring str i (string-length str))))

(string-insert "helloworld" 5)

; ex20
(define (string-delete str i)
  (string-append (substring str 0 i) (substring str (+ i 1) (string-length str))))
(string-delete "hello_world" 5)

