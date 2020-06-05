
(define HEIGHT 300) ; distances in pixels
(define WIDTH  100)
(define YDELTA 3)
 
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
 
(define CENTER (/ (image-height ROCKET) 2))

(define (show x)
  (cond
    [(string? x) 
      (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)]
    [(<= -3 x -1) 
      (place-image (text (number->string x) 20 "red")
        10
        (* 3/4 WIDTH)
        (place-image
          ROCKET
          10
          (- HEIGHT CENTER)
          BACKG))]
    [(>= x 0)
      (place-image ROCKET 10 (- x CENTER) BACKG)]))

(define (launch x ke)
  (cond
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))

(define(fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x 1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

(define (main1 s)
  (big-bang s
    [to-draw show]
    [on-key launch]
    [on-tick fly]))

(main1 100)