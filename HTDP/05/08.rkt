#lang racket

; cons
(cons "mercury" '())

(cons "mercury" null)

(cons "venus" (cons "mercury" '()))

'("vernus" "mer")

(cons "eartch" (cons "vernus" (cons "mercu" '())))

(define-struct pair (left right))

(define (our-cons a-value a-list)
  (cond
    [(empty? a-list) (make-pair a-value a-list)]
    [(pair? a-list) (make-pair a-value a-list)]
    [else (error "our-cons: second arugment...")]))

(our-cons 1 (make-pair 1 2))

(define (our-first a-list)
  (if (empty? a-list)
      (error "Our-first...")
      (pair-left a-list)))

(our-first (make-pair 1 (make-pair 2 3)))

(define (our-rest a-list)
  (if (empty? a-list)
      (error "our-rest")
      (pair-right a-list)))

(our-first (our-rest (make-pair 1 (make-pair 2 3))))

(define (contains-flatt? alon)
  (cond
    [(empty? alon) #f]
    ((cons? alon)
     (or (string=? (first alon) "Flatt")
         (contains-flatt? (rest alon))))))

(contains-flatt? (cons "a" (cons "Flatt" (cons "C" '()))))

(define (contains? alon target)
  (cond
    [(empty? alon) #f]
    ((cons? alon)
     (or (string=? (first alon) target)
         (contains? (rest alon ) target)))))

(contains? (cons "a" (cons "Flatt" (cons "C" '()))) "Flatt")