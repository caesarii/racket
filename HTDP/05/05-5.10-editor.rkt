;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 05-5.10-editor) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

(define Height 20)
(define Middle (/ Height 2))

(define-struct editor (pre post))


(define (draw-text str)
  (text str 11 "black"))

(define (text-pre editor)
  (draw-text (editor-pre editor)))

(define (text-post editor)
  (draw-text (editor-post editor)))

(define (start-caret editor)
  (image-width (text-pre editor)))

; 垂直居中水平排列
(define (place-image-center image x scene)
  (place-image/align image x Middle "left" "center" scene))
  
                   

(define (draw-editor editor)
  (place-image-center
   (text-pre editor)
   0
   (place-image-center
    (line 0 Height "red")
    (start-caret editor)
    (place-image-center (text-post editor) (+ 1 (start-caret editor)) (empty-scene 200 20)))))
            

(define (editor-process editor ke)
  (cond
    [(key=? ke "\b") (editor-del editor)]
    [else (editor-input editor)]))

(define (editor-del editor)
  (string-append
   (substring (editor-pre editor) 0 (string-length (editor-pre editor)))
              (editor-post editor)))

(define (editor-input editor)
  editor)
; (draw-editor (make-editor "hello" "world"))


(define (main p0)
  (big-bang p0
    ; [on-tick draw-editor]
    [on-key editor-process]
    [to-draw draw-editor]
    ))

(main (make-editor "hello" "world"))
          