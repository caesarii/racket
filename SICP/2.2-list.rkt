#lang racket

; list-ref
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

(list-ref squares 3)

; length-recursive

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(length (list 0 1 2 3 4 5))

; length-iterative
(define (length-iterative items)
  (define (length-iter items length)
    (cond
      [(null? items) length]
      [else (length-iter (cdr items) (+ length 1))]))
  (length-iter items 0))

(length-iterative (list 0 1 2 3 4 5))

; append

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(append (list 0 1 2) (list 3 4 5))

; 这种方式不行
(define (append-v2 list1 list2)
  (if (null? list2)
      list1
      (cons (append list1 (car list2)) (cdr list2))))

(append-v2 (list 0 1 2) (list 3 4 5))

; last-pair
(define (last-pair items)
  (if (= (length items) 1)
      (car items)
      (last-pair (cdr items))))

(last-pair (list 23 73 149 34))

; reverse

(define (reverse items)
  (if (null? items)
      null
      (append (reverse (cdr items)) (list (car items)))))

(reverse (list 1 4 9 16 25))

; same-parity

(define (same-parity x . y)
    (define (iter z result)
      (if (null? z)
          result
          (if (= (remainder (car z) 2) (remainder x 2))
              (iter (cdr z) (append result (list (car z))))
              (iter (cdr z) result))))
    (iter y (list x)))

(same-parity 1 2 3 4 5 6 7)

; map
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(map abs (list -1 2.5 -11 17))

(map (lambda (x) (* x x)) (list 1 2 3 4))

; for-each
(define (for-each proc items)
  (if (null? items)
      (newline)
      (let ()
        (proc (car items))
        (for-each proc (cdr items)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 1 2 3 4))


; count-leaves
(define (count-leaves x)
  (cond [(null? x) 0]
        [(not (list? x)) 1]
        [else (+ (count-leaves (car x))
                 (count-leaves (cdr x)))]))
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)


; deep-reverse

(define (deep-reverse tree)
  (define (deep-reverse-iter tar res)
    (if (null? tar)
        res
        (if (pair? (car tar))
            (deep-reverse-iter (cdr tar) (cons (deep-reverse-iter (car tar) `() ) res ))
            (deep-reverse-iter (cdr tar) (cons (car tar) res)))))
  (deep-reverse-iter tree `()))



(define y (list (list 1 2) (list 3 4)))

(deep-reverse y)

