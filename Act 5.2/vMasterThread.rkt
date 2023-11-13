#lang racket

(define (sum-parallel n)
    (define numtra (/ n 2))

    (define p1 (dynamic-place "vWorkingThread.rkt" 'principal))
    (define p2 (dynamic-place "vWorkingThread.rkt" 'principal))

    (place-channel-put p1 1)
    (place-channel-put p1 numtra)
    (place-channel-put p2 (+ numtra 1))
    (place-channel-put p2 n)

    (+ 
        (place-channel-get p1)
        (place-channel-get p2))
    )

;; Comentarios para ejecutar:
(sum-parallel 1e7)