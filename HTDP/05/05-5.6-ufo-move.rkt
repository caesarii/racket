;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 05-5.6-ufo-move) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define MTS (empty-scene 100 100))

(define DOT (circle 3 "solid" "red"))

(define (scene+dot u)
  (place-image DOT (posn-x (ufo-posn u)) (posn-y (ufo-posn u)) MTS))

; struct ufo
(define-struct ufo (posn vel))
; struct vel
(define-struct vel (deltax deltay))


(define (ufo-move-1 u)
  (make-ufo (posn+ (ufo-posn u) (ufo-vel u))
            (ufo-vel u)))

; 基于点 p 和速度 v 计算下一个点位置
(define (posn+ p v)
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))

(define (stop? u)
  (> (posn-x (ufo-posn u)) 90))

(define (main u0)
  (big-bang u0
    [on-tick ufo-move-1]
    [to-draw scene+dot]
    [stop-when stop?]))

(main (make-ufo (make-posn 10 10) (make-vel 1 1)))

