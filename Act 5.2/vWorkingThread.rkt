#lang racket

(provide principal-fractions)
;;; Problema 1 
;; Misma implementacion que su contraparte secuencial, con la diferencia de que manejamos al inicio y fin de la secuencia como parametros, y no tomamos en cuenta a los denominadores
(define (sum-worker-fractions start end dn)
    (define (fraction i dn)
        (exact->inexact (/ i dn)))

    (let loop ([i start] [acc 0])
        (if (> i end)
                acc
                (loop (+ i 1) (+ acc (fraction i dn))))))

;; La función obtiene los valores de start, end y los denominadores dn del canal y llama a la función sum-worker-fractions con estos valores, despues coloca el resultado en el canal
(define (principal-fractions channel)
    (place-channel-put channel (sum-worker-fractions (place-channel-get channel) (place-channel-get channel) (place-channel-get channel))))

;;; Problema 2
;; Misma implementacion que su contraparte secuencial, con la diferencia que se toman puntos de inicio y fin en lugar de tomar un numero de iteraciones
(provide principal-mult)
(define (sum-worker-multiples start end)
  (define (multiple i)
    (exact->inexact(* i 3)))
  (define (loop i acc)
    (if (> i end)
        acc
        (loop (+ i 1) (+ acc (multiple i)))))
  (loop start 0))

;; La función obtiene los valores de start y end del canal y llama a la función sum-worker-multiples con estos valores despues coloca el resultado en el canal.
(define (principal-mult channel)
  (place-channel-put channel (sum-worker-multiples (place-channel-get channel) (place-channel-get channel))))