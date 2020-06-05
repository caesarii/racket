(define WIDTH 300) ; distances in terms of pixels
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))
(define UFO (overlay (circle 10 "solid" "green") (rectangle 40 5 "solid" "green")))
 
(define (render y)
  (place-image UFO 100 y MTSCN))

(define (render/status y)
  (cond 
    [(<= 0 y CLOSE)
      (place-image 
        (text "descending" 11 "green")
        10
        10
        (render y))]
    [(and (< CLOSE y) (<= y HEIGHT))
      (place-image 
        (text "closing" 11 "orange")
        10
        10
        (render y))]
    [(> y HEIGHT)
      (place-image 
        (text "landed" 11 "red")
        10
        10
        (render y))]))

(define (nxt y)
  (+ y 0.5))

(define (stop val)
  (> val 100))

(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render/status]
     [stop-when zero?]))

(main 10)
 


;;; (check-expect (nxt 11) 14)

;;; (check-expect (render 11) (place-image UFO ... 11 MTSCN))
