;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2htdp:image) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

; circle
(circle 30 "outline" "red")

(circle 20 "solid" "blue")

(circle 20 100 "blue")

(circle 30 "outline" (pen "red" 5 "short-dash" "butt" "bevel"))

; pen
(line 400 100 (pen "red" 10 "short-dash" "butt" "bevel"))
(line 400 100 (pen "red" 10 "short-dash" "round" "bevel"))
; 看不出来差别
(line 400 100 (pen "red" 10 "short-dash" "projecting" "bevel"))

(line 400 100 (pen "red" 10 "short-dash" "butt" "miter"))


; ellipse
(ellipse 60 30 "outline" (pen "green" 5 "solid" "butt" "bevel"))

(ellipse 30 60 "solid" (color 255 12 124))

(ellipse 30 60 20 (color 255 12 124))

; line
(line 100 100 "red")

; add-line
(add-line
    (rectangle 100 100 "solid" "darkolivegreen")
    25 25 75 75
    (make-pen "goldenrod" 30 "solid" "round" "round"))

; add-curve
(add-curve (rectangle 100 100 "solid" "black")
             20 20 0 1/3
             80 80 0 1/3
             "white")


; text
(text "Hello" 24 "olive")

(image-width empty-image)

(above empty-image (rectangle 100 200 "solid" "green"))

; triangle
(triangle 100 "solid" "tan")

(right-triangle 300 400 "outline" "blue")

(isosceles-triangle 300 90 "solid" "lightseagreen")

; overlay
(overlay (rectangle 30 60 "solid" "orange")
         (ellipse 60 30 "solid" "purple"))

(overlay/align "left" "middle"
                 (rectangle 30 60 "solid" "orange")
                 (ellipse 60 30 "solid" "purple"))

 (underlay (rectangle 30 60 "solid" "orange")
            (ellipse 60 30 "solid" "purple"))

 (empty-scene 400 400 (color 99 99 99))