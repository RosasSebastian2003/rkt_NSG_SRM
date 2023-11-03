#lang racket 

(provide principal)

(define (suma-aleatoria numero)
    (for/sum ([i (in-range numero)]) (random)))

(define (principal canal)
    (place-channel-put canal (suma-aleatoria (place-channel-get canal))))
