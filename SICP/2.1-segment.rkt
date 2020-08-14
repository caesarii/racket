#lang racket

; point
(define (make-point x y)
  (cons x y))

(define (point-x p)
  (car p))

(define (point-y p)
  (cdr p))

(define pt (make-point 0 0))

(point-x pt)
(point-y pt)

; segment
(define (make-segment start end)
  (cons start end))

(define (segment-start sg)
  (car sg))

(define (segment-end sg)
  (cdr sg))

(define (midpoint-segment sg)
  (make-point
   (/ (+ (point-x (segment-start sg))
         (point-x (segment-end sg)))
      2)
   (/ (+ (point-y (segment-start sg))
         (point-y (segment-end sg)))
      2)))

(define pt-2 (make-point 4 6))

(define sg (make-segment pt pt-2))

(midpoint-segment sg)

; print-point
(define (print-point p)
  (newline)
  (display "(")
  (display (point-x p))
  (display ", ")
  (display (point-y p))
  (display ")"))

(print-point (midpoint-segment sg))

; rect

(define (make-rect start end)
  (cons start end))

(define (rect-start rect)
  (car rect))

(define (rect-end rect)
  (cdr rect))

(define (rect-length rect)
  (+
   (* 2 (- (point-x (rect-end rect)) (point-x (rect-start rect))))
   (* 2 (- (point-y (rect-end rect)) (point-y (rect-start rect))))))

; v2 使用 let
(define (rect-length-v2 rect)
  (let ([start (rect-start rect)]
        [end (rect-end rect)])
    (+
     (* 2 (- (point-x end) (point-x start)))
     (* 2 (- (point-y end) (point-y start))))))

(define rect (make-rect (make-point 0 0) (make-point 4 6)))

(newline)
(rect-length-v2 rect)



