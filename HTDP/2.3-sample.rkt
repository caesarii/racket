;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.3-sample) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

; 观众数
(define (attendees ticket-price)
  (- 120 (* (* (- ticket-price 5.0) 10) 15)))

(attendees 5.0)
(attendees 5.1)
(attendees 4.9)

; 毛利润
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(revenue 5.0)

; 成本
(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))
(cost 5.0)

; 净利润
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))


(profit 1.0)
(profit 3.0)
(profit 5.0)
(profit 7.0)
(profit 9.0)

(define (cost-2 ticket-price)
  (* 1.5 (attendees ticket-price)))

(define (profit-2 ticket-price)
  (- (revenue ticket-price) (cost-2 ticket-price)))

(profit-2 3.0)
(profit-2 4.0)
(profit-2 5.0)




