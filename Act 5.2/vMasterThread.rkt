#lang racket

(provide sum-frac-parallel sum-mult-parallel)

;;; Problema 1
;; Para ejecutar esta funcion, hace falta tener el archivo vWorkingThread.rkt en el mismo directorio
;; La manera de ejecutar la funcion es la siguiente:
;; (sum-frac-parallel n dn1 dn2), donde n corresponde al numero hasta el cual se desea calcular la suma de fracciones, dn1 corresponde al denominador de la primera fraccion y dn2 corresponde al denominador de la segunda fraccion, en nuestro caso, 1e9, 3 y 7 respectivamente


(define (sum-frac-parallel n dn1 dn2)
  (define p1 (dynamic-place "vWorkingThread.rkt" 'principal-fractions))
  (define p2 (dynamic-place "vWorkingThread.rkt" 'principal-fractions))

  (place-channel-put p1 1)
  (place-channel-put p1 n)
  (place-channel-put p1 dn1)

  (place-channel-put p2 1)
  (place-channel-put p2 n)
  (place-channel-put p2 dn2)

  (+ 
    (place-channel-get p1)
    (place-channel-get p2)
  )
)

(sum-frac-parallel 1e9 3 7)
;;; Problema 2
;; Para ejecutar esta funcion, hace falta tener el archivo vWorkingThread.rkt en el mismo directorio
;; La manera de ejecutar la funcion es la siguiente:
;; (sum-mult-parallel n), donde n corresponde al numero hasta el cual se desea calcular la suma de multiplicaciones, en nuestro caso, 1e9
(define (sum-mult-parallel n)
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


(sum-mult-parallel 1e9)