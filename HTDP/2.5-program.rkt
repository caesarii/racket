;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.5-program) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

(write-file "sample.dat" "212")

(read-file "sample.dat")

(write-file 'stdout "212")

;(read-file 'stdin)

; 温度转换
(define (C f)
  (* 5/9 (- f 32)))

(C 32)
(C 212)

(define (convert in out)
  (write-file out
              (string-append
               (number->string
                (C (string->number
                    (read-file in))))
               "\n")))
(write-file "sample.dat" "212")

(convert "sample.dat" 'stdout)

(convert "sample.dat" "out.dat")

(read-file "out.dat")




