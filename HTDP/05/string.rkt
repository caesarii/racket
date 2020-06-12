;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname string) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))



(define (string-first s)
  (substring s 0 1))
(string-first "01234")
; 删除第一个字符
(define (string-else-first s)
  (substring s 1 (string-length s)))

(string-else-first "01234")

; 获取最后一个字符
(define (string-last s)
  (substring s (- (string-length s) 1) (string-length s)))
(string-last "01234")
; 删除最后一个字符
(define (string-else-last s)
  (substring s 0 (- (string-length s) 1)))
(string-else-last "01234")