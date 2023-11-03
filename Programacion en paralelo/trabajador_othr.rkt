#lang racket 

(require "trabajador.rkt")

(define numtra 1)
(define pi (dynamic-place "trabajador.rkt" 'principal))
(define tiempo-inicial (current-seconds))
(place-channel-put pi (/ 999999996 numtra))
(+ (place-channel-get pi) 0)
(define tiempo-final (current-seconds))
(- tiempo-final tiempo-inicial)