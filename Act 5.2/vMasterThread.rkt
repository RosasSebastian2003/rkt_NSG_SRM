#lang racket

(define (sum-parallel n)
    (define numtra (/ n 2))

    (define p1 (dynamic-place "vWorkingThread.rkt" 'principal-div))
    (define p2 (dynamic-place "vWorkingThread.rkt" 'principal-div))

    (place-channel-put p1 1)
    (place-channel-put p1 numtra)
    (place-channel-put p2 (+ numtra 1))
    (place-channel-put p2 n)

    (+ 
        (place-channel-get p1)
        (place-channel-get p2))
    )

(sum-parallel 1e9)

(define (sum-mults n)
  (define numtra (/ n 2))

  (define p1 (dynamic-place "vWorkingThread.rkt" 'principal-mult))
  (define p2 (dynamic-place "vWorkingThread.rkt" 'principal-mult))

  (place-channel-put p1 1)
  (place-channel-put p1 numtra)
  (place-channel-put p2 (+ numtra 1))
  (place-channel-put p2 n)

  (+ 
    (place-channel-get p1)
    (place-channel-get p2)
  )
)

(sum-mults 1e9)