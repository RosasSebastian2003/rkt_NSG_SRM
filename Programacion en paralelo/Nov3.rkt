#lang racket
(define numtra 1)

(define (suma-aleatorios numero)
    (for/sum ([i (in-range numero)]) (random)))

(define tiempo-inicial (current-seconds))
(suma-aleatorios (/ 999999996 numtra))
(define tiempo-final (current-seconds))
(- tiempo-final tiempo-inicial)
