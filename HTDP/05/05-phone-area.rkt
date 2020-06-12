;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 05-phone-area) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

(define-struct phone (area number))

(define-struct centry (name home office cell))

(define fisler (make-centry "Fisler"
                            (make-phone 207 "363-2421")
                            (make-phone 208 "363-2421")
                            (make-phone 209 "363-2421")))

(phone-area (centry-office fisler))


             

