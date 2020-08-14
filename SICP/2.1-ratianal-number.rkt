#lang racket

(define (log x)
  (newline)
  (display x))

; GCD(a, b) = GCD(b, r)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 4 8)

(define (make-rat n d)
  (let ((g (gcd n d)))
        (cons (/ n g) (/ d g))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
               (* (denom x)(denom y))))


(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
               (* (denom y) (denom x))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(add-rat (make-rat 1 2) (make-rat 1 2))

(sub-rat (make-rat 1 2) (make-rat 1 2))

(mul-rat (make-rat 1 2) (make-rat 1 2))

(div-rat (make-rat 1 2) (make-rat 1 2))

(equal-rat? (make-rat 1 2) (make-rat 1 2))

(define (print-rat x)
  (newline)
  (cond
    [(= (numer x) 0) (display 0)]
    [(= (numer x) (denom x)) (display 1)]
    [else (print-real-rat x)]))

(define (print-real-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))

(print-rat (add-rat one-half one-half))

(print-rat (sub-rat one-half one-half))

(print-rat (mul-rat one-half one-half))

(print-rat (div-rat one-half one-half))

(log (equal-rat? one-half one-half))








               

