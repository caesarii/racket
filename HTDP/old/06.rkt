#lang racket

(struct posn (x y))

(posn 1 2)
(posn? posn(3 4))
(posn-x (posn 1 2))