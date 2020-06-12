;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

; create a posn structure
(make-posn 3 4)

; structure just like number or string

(define one-posn (make-posn 8 6))


; define a point
(define p (make-posn 31 26))

; subscripting
(posn-x p)
(posn-y p)


; distance-to-0

(define (distance-to-0 ap)
  (sqrt
   (+ (sqr (posn-x ap))
      (sqr (posn-y ap)))))
   
(distance-to-0 (make-posn 3 4))

; ex64
(define (manhattan-distance ap)
  (+ (posn-x ap) (posn-y ap)))

(manhattan-distance (make-posn 3 4))