#lang racket

(define (insert-everywhere-twice x lst)
    (if (null? lst)
        (list (list x x))
        (cons (cons x (cons x lst)) (map (lambda (rest) (cons (car lst) rest)) (insert-everywhere-twice x (cdr lst))))
    )
)