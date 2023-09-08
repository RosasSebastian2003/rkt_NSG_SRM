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