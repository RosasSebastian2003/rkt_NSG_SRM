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