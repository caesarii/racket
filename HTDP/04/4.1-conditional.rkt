
; cond
(define (next traffic-light-state)
  (cond 
    [(string=? "red" traffic-light-state) "green"]
    [(string=? "green" traffic-light-state) "yellow"]
    [(string=? "yellow" traffic-light-state) "red"]))

(next "red")
(next "green")
(next "yellow")

; reward
(define (reward s)
 (cond
  [(<= 0 s 10) "bronze"]
  [(and (< 10 s) (<= s 20)) "silver"]
  [(< 20 s) "gold"]))

  (reward 3)

; ex49
(define (evalue y)
  (- 200 
    (cond 
      [(> y 200) 0]
      [else y])))
(evalue 100)

(define (create-rocket-scene.v5 h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 h MTSCN)]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))


(define (create-rocket-scene.v5 h)
   (place-image 
      ROCKET 
      50 
      (cond 
        [(<= h ROCKET-CENTER-TO-TOP) h]
        [(> h ROCKET-CENTER-TO-TOP) ROCKET-CENTER-TO-TOP])
      MTSCN))