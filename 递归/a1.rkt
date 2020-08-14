#lang racket

; log
(define (i-log items)
 (let ((x (car items)) (y (cdr items)))
   (display x)
   (if (not (null? y))
       (i-log y)
       (newline))))

; (i-log (list 1 2))

; ensure
(define (ensure condition message)
  (if (not condition)
      (i-log (list "测试失败" message))
      (i-log (list "测试成功" message))))

; (ensure #t "test 1")
; (ensure #f "test 2")

; is-array
(define (is-array o)
  (list? o))

(ensure (eqv? (is-array (list 1 2 3)) #t) "is-array 1")
(ensure (eqv? (is-array 1) #f) "is-array 2")

; array-equals
(define (array-equals a b)
  (cond
    ((not (= (length a) (length b))) #f)
    ((and (null? a) (null? b)) #t)
    ((not (eqv? (car a) (car b))) #f)
    (else (array-equals (cdr a) (cdr b)))))

(ensure (array-equals null null) "test array equals 1")
(ensure (array-equals (list 1) (list 1)) "test array equals 2")
(ensure (array-equals [list 1 2] [list 1 2]) "test array equals 3")
(ensure (not (array-equals [list 1 2 3] [list 1 3 2])) "test array equals 4")

; array-deep-equals
(define (array-deep-equals a b)
  (cond
    ((not (= (length a) (length b))) #f)
    ((and (null? a) (null? b)) #t)
    ((xor (list? (car a)) (list? (car b))) #f)
    ((and (list? (car a)) (list? (car b))) (let ((r (array-deep-equals (car a) (car b))))
                                             (if r
                                                 (array-deep-equals (cdr a) (cdr b))
                                                 #f)))
    ((not (or (list? (car a)) (list? (car b)))) (if (eqv? (car a) (car b))
                                                    (array-deep-equals (cdr a) (cdr b))
                                                    #f))))

(define (test-array-deep-equals arrayDeepEquals)
  (let ((a1 null)
        (b1 null)
        (a2 (list (list 1)))
        (b2 (list (list 1)))
        (a3 (list (list (list 1)) (list (list 1))))
        (b3 (list (list (list 1)) (list (list 1))))
        (a4 (list (list 1 2)))
        (b4 (list (list 1 2)))
        (a5 (list (list 1 2) (list 3 4)))
        (b5 (list (list 1 2) (list 4 3))))
    (ensure (arrayDeepEquals a1 b1) "test array deep equals 1")
    (ensure (arrayDeepEquals a2 b2) "test array deep equals 2")
    (ensure (arrayDeepEquals a3 b3) "test array deep equals 3")
    (ensure (arrayDeepEquals a4 b4) "test array deep equals 4")
    (ensure (not (arrayDeepEquals a5 b5)) "test array deep equals 5")
    (arrayDeepEquals a5 b5)))

(test-array-deep-equals array-deep-equals)

