#lang racket
; 圆的面积
(define (area-of-disk r)
  (* 3.14 (* r r)))

(area-of-disk 5)

; 圆环的面积
(define (area-of-ring outer inner)
  (- (area-of-disk outer)
     (area-of-disk inner)))

(area-of-ring 5 3)

; 美元转换欧元
(define (dollar->euro dollar)
  (* dollar 1.1))

(dollar->euro 10)

; 三角形面积
(define (triangle len h)
  (/ (* len h) 2))

(triangle 3 4)

; 数字
(define (convert3 first second third)
  (+ (+ (* second 10) (* third 100)) first))
(convert3 1 2 3)

; 代数
(define (algebra1 n)
  (+ (/ 3.14 3) 2))
(algebra1 2)

(define (algebra2 n)
  (+ (expt n 2) 10))

(algebra2 10)

(define (algebra3 n)
  (+ (* 0.5 (expt n 2)) 20))
(algebra3 10)

(define (algebra4 n)
  (- 2 (/ 1 n)))

(algebra4 1)
