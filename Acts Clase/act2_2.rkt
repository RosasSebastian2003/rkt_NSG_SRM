#lang racket

;;Problema 1, insert everywhere twice
(define (insert-everywhere-twice x lst)
    (cond 
        ((null? lst) (list(list x x)))
        (else (cons (append (list x x) lst)
        (map (lambda (rest) (cons (car lst) rest))
        (insert-everywhere-twice x (cdr lst)))))
    )
)

(displayln "Problema 1, Insertar un elemento dos veces en todas las partes de una lista")
(displayln "ej. 1, 1 '()")
(displayln (insert-everywhere-twice 1 '()))
(newline)

(displayln "ej. 2, 1 '(a)")
(displayln (insert-everywhere-twice 1 '(a)))
(newline)

(displayln "ej. 3, 1 '(a b c)")
(displayln (insert-everywhere-twice 1 '(a b c)))
(newline)

(displayln "ej. 4,  1 '(a b c d e)")
(displayln (insert-everywhere-twice  1 '(a b c d e)))
(newline)

(displayln "ej. 5,  x '(1 2 3 4 5 6 7 8 9 10)")
(displayln (insert-everywhere-twice 'x '(1 2 3 4 5 6 7 8 9 10)))
(newline)

;;Problema 2, encode
(define (encode lst)
    (define (encode-aux lst prev count)
        (cond 
            ((null? lst) '())
            ((equal? (car lst) prev) (encode-aux (cdr lst) prev (+ count 1)))
            (else (cons prev (cons count (encode-aux (cdr lst) (car lst) 1)))
            )
        )
    )

    (if (null? lst) '() (encode-aux (cdr lst) (car lst) 1))
)

(displayln "Problema 2, Hallar el número de veces que se repite un elemento en una lista")
(displayln "ej. 1, '()")
(displayln (encode '()))
(newline)

(displayln "ej. 2, '(a a a a b c c a a d e e e e)")
(displayln (encode '(a a a a b c c a a d e e e e)))
(newline)

(displayln "ej. 3, '(1 2 3 4 5)")
(displayln (encode '(1 2 3 4 5)))
(newline)

(displayln "ej. 4, '(9 9 9 9 7 7))")
(displayln (encode '(9 9 9 9 7 7)))
(newline)

;;Problema 3, busqueda lineal
(define (linear-search lst x eq-fun)
    (define (linear-search-aux lst x eq-fun indx)
        (cond
            ((null? lst) '())
            ((eq-fun (car lst) x)
            (cons indx (linear-search-aux (cdr lst) x eq-fun (+ indx 1)))
            )
            (else (linear-search-aux (cdr lst) x eq-fun (+ indx 1))
            )
        )
    )

    (linear-search-aux lst x eq-fun 0)
)

(displayln "Problema 3, Busqueda lineal")
(displayln "ej. 1, '() 5 =")
(displayln (linear-search '() 5 =))
(newline)

(displayln "ej. 2, '(48 77 30 31 5 20 91 92 69 5 97 28 32 17 18 5 96) 5 =")
(displayln (linear-search '(48 77 30 31 5 20 91 92 69 5 97 28 32 17 18 5 96) 5 =))
(newline)

(displayln "ej. 3, '(\"red\" \"blue\" \"green\" \"black\" \"white\" \"red\") \"red\" string=?")
(displayln (linear-search '("red" "blue" "green" "black" "white" "red") "red" string=?))
(newline)

(displayln "ej. 4, '(a b c d e f g h) 'h equal?")
(displayln (linear-search '(a b c d e f g h) 'h equal?))
(newline)

;;Problema 4, deriv
(define (deriv f h)
    (lambda (x)
        (/ (- (f (+ x h)) (f x)) h)
    )
)

(define f (lambda (x) (* x x x)))

(define df (deriv f 0.001))
(define ddf (deriv df 0.001))
(define dddf (deriv ddf 0.001))

(displayln "Problema 4, Derivar")
(displayln "ej. 1, df 5")
(displayln (df 5))
(newline)

(displayln "ej. 2, ddf 5")
(displayln (ddf 5))
(newline)

(displayln "ej. 3, dddf 5")
(displayln (dddf 5))
(newline)

;;Problema 5, Newton
(define (newton f n)
    (define (newton-iter x k)
        (if (= k 0) x (newton-iter (- x (/ (f x) ((deriv f 0.0001) x))) (- k 1)))
    )
    
    (newton-iter 0 n)
)

(displayln "Problema 5, Newton")
(displayln "ej. 1, lambda (x) (- x 10)) 1")
(displayln (newton (lambda (x) (- x 10)) 1))
(newline)

(displayln "ej. 2, (lambda (x) (+ (* 4 x) 2)) 1")
(displayln (newton (lambda (x) (+ (* 4 x) 2)) 1))
(newline)

(displayln "ej. 3, (lambda (x) (+ (* x x x) 1)) 50")
(displayln (newton (lambda (x) (+ (* x x x) 1)) 50))
(newline)

(displayln "ej. 4, (lambda (x) (+ (cos x) (* 0.5 x))) 5")
(displayln (newton (lambda (x) (+ (cos x) (* 0.5 x))) 5))
(newline)

;;Problema 6, Coseno
(define (coseno x n)
    (define (fact k)
        (if (= k 0) 1 (* k (fact (- k 1))))
    )

    (define (cos-k x k)
        (let ((sign (if (even? k) 1 -1)) (numerator (expt x (* 2 k)))
        (denominator (fact (* 2 k)))) (* sign (/ numerator denominator)))
    )

    (define (cos-sum x k)
        (if (= k n) 0 (+ (cos-k x k) (cos-sum x (+ k 1))))
    )   

    (cos-sum x 0)
)

(displayln "Problema 6, Newton")
(displayln "ej. 1, coseno 0.523598776 5")
(displayln (coseno 0.523598776 5))
(newline)

(displayln "ej. 2,coseno 0.78539816310 7")
(displayln (coseno 0.78539816310 7))
(newline)

(displayln "ej. 3, coseno 10.0 18")
(displayln (coseno 10.0 18))
(newline)
