;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4.3-traffic) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

; ex50
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))


(define (string->light str)
  (circle 40 "solid" (traffic-light-next str)))

; ex51
; traffic light
(define DURATION 180)
(define LIGHT-DURATION (/ DURATION 3))

(define (reset s ke)
  DURATION)

(define (number->light s)
  (cond
    [(> s (* LIGHT-DURATION 2)) (string->light "yellow")]
    [(> s LIGHT-DURATION) (string->light "red")]
    [(> s 0) (string->light "green")]))


(big-bang DURATION
  [to-draw number->light]
  [on-tick sub1]
  [stop-when zero?]
  [on-key reset])


; red dot
(define POSITION 100)


(define (draw-red-dot)
  (circle 30 "solid" "red"))

(define (draw-position x)
  (place-image 
    (draw-red-dot) 
    100 
    (empty-scene 300 300)))

(define (keh p k)
  (cond
    [(string=? "left" k) (- p 5)]
    [(string=? "right" k) (+ p 5)]
    [else p]))
    
(big-bang POSITION 
  [to-draw draw-position]
  [on-key keh]
  [stop-when zero?])


