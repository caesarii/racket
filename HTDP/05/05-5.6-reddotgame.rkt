;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 05-5.6-reddotgame) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define MTS (empty-scene 100 100))

(define DOT (circle 3 "solid" "red"))

(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

(define (posn-up-x p n)
  (make-posn (+ (posn-x p) n) (posn-y p)))

(define (x+ p)
  (posn-up-x p 3))

(define (reset-dot p x y me)
  (cond
    [(mouse=? me "button-down") (make-posn x y)]
    [else p]))



(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset-dot]
    [to-draw scene+dot]))

(main (make-posn 10 10))





