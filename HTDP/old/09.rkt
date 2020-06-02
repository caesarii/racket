;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |09|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#lang racket

; 空表
(display empty)

; cons
(display (cons 'mercury empty))

; list-of-3-numbers
(define (list-of-3-numbers x y z)
  (cons x (cons y (cons z empty))))
; x
(define (point-x point)
  (car point))

; y
(define (point-y point)
  (car (cdr point)))

; z
(define (point-z point)
  (car (cdr (cdr point))))


; add-up-3
(define (add-up-3 nums)
  (+ (car nums) ( + (car (cdr nums)) (car (cdr nums)))))

(list-of-3-numbers 1 2 3)
(add-up-3 (list-of-3-numbers 1 2 3) )

; 乘方
(define (exp2 num1 num2)
  (* (- num1 num2) (- num1 num2)))

; distane-0-for-3
(define (distance-0-for-3 point1 point2)
  (sqrt (+
         (+
          (exp2 (point-x point1) (point-x point2))
          (exp2 (point-y point1) (point-y point2))
         (exp2 (point-z point1) (point-z point2))))))

(distance-0-for-3 (list-of-3-numbers 3  4 5) (list-of-3-numbers 0 0 0))

; constains-2-doll?
