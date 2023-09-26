#lang racket

;;Tabla de estados - Multiplicación
(define dfa-mult
(list 
(list 
(list 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

 
 ;;Tabla de estados - Identificador
(define dfa-iden
(list 
(list
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1 1 -1 -1)
(list -1 -1 -1 -1 -1 -1 -1 -1 -1  1  1 1 1 1 1 -1 -1)
)
(list 1)
)
)
 
;;Tabla de estados - Igualdad
(define dfa-asig
(list 
(list
(list -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1 1 -1 -1)
(list -1 -1 -1 -1 -1 -1 -1 -1 -1  1  1 1 1 1 1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - Suma
(define dfa-suma
(list 
(list 
(list -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - Resta
(define dfa-rest
(list 
(list 
(list -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - Division
(define dfa-divi
(list 
(list 
(list -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)


;;Tabla de estados - Potencia
(define dfa-pote
(list 
(list 
(list -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - parentesis derech0
(define dfa-pade
(list 
(list 
(list -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - parentesis izquierdo
(define dfa-paiz
(list 
(list 
(list -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - reales
(define dfa-real
(list 
(list 
(list -1 -1 -1 1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 1 -1 1 -1)
)
(list 1)
)
)

;;Tabla de estados - enteros
(define dfa-ente
(list 
(list 
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1)
)
(list 1)
)
)

;;Tabla de estados - comentarios
(define dfa-come
(list 
(list 
(list -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -1)
)
(list 1)
)
)

;;Tabla de estados - Separaciones
(define dfa-sepa
(list 
(list 
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1)
)
(list 1)
)
)
(define (determina-grupo linea)
(cond
  [(equal? (string-ref linea 0) #\*) 0]
  [(equal? (string-ref linea 0) #\=) 1]
  [(equal? (string-ref linea 0) #\+) 2]
  [(equal? (string-ref linea 0) #\-) 3]
  [(equal? (string-ref linea 0) #\/) 4]
  [(equal? (string-ref linea 0) #\^) 5]
  [(equal? (string-ref linea 0) #\() 6]
  [(equal? (string-ref linea 0) #\)) 7]
  [(equal? (string-ref linea 0) #\ ) 8]
  [(and (>= (char->integer (string-ref linea 0)) 48) (<= (char->integer (string-ref linea 0)) 57)) 9]
  [(equal? (string-ref linea 0) #\_) 10]
  [(and (>= (char->integer (string-ref linea 0)) 65) (<= (char->integer (string-ref linea 0)) 90)) 11]
  [(and (>= (char->integer (string-ref linea 0)) 97) (<= (char->integer (string-ref linea 0)) 100)) 12]
  [(equal? (string-ref linea 0) #\e) 13]
  [(and (>= (char->integer (string-ref linea 0)) 102) (<= (char->integer (string-ref linea 0)) 122)) 14]
  [(equal? (string-ref linea 0) #\.) 15]
  [else 16]
  )
)


















(define (recorre-dfa dfa linea)

  (define (ciclo estado tabla finales linea-reducida linea-original estado-final-alcanzado pos-aceptada pos-actual)
    (if (string=? linea-reducida "")
        (if (= estado-final-alcanzado -1) #f (substring linea-original 0 (+ pos-aceptada 1)))
        (cond
          [(= (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) -1) (if (= estado-final-alcanzado -1) #f (substring linea-original 0 (+ pos-aceptada 1)))]
          [(member (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) finales) (ciclo (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) tabla finales (substring linea-original (+ pos-actual 1)) linea-original (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) pos-actual (+ pos-actual 1))]
          [else (ciclo (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) tabla finales (substring linea-original (+ pos-actual 1)) linea-original estado-final-alcanzado pos-aceptada (+ pos-actual 1))]
          )
        )
    )
  (ciclo 0 (car dfa) (car (cdr dfa)) linea linea -1 -1 0)
  )
















(define (tokens-en-linea-v2 linea)
 (if (not (string=? linea "")) 
(cond
  [(recorre-dfa dfa-iden linea) (begin
                                                           (displayln (recorre-dfa dfa-iden linea))
                                                           (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-iden linea))))
                                                           )
                                                           ]
  [(recorre-dfa dfa-real linea) (begin
                                                                    (displayln (recorre-dfa dfa-real linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-real linea))))
                                                                    )
                                                                    ]
  [(recorre-dfa dfa-ente linea) (begin
                                          (displayln (recorre-dfa dfa-ente linea))
                                          (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-ente linea))))
                                                                    )
                                          ]
  [(recorre-dfa dfa-come linea) (begin
                                  (displayln (recorre-dfa dfa-come linea))
                                  (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-come linea))))
                                                                    )
                                  ]
  [(recorre-dfa dfa-mult linea) (begin
                                 (displayln (recorre-dfa dfa-mult linea))
                          (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-mult linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-asig linea) (begin
                               (displayln (recorre-dfa dfa-asig linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-asig linea))))
                                                                    )
                               ]
  [(recorre-dfa dfa-suma linea) (begin
                                 (displayln (recorre-dfa dfa-suma linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-suma linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-rest linea) (begin
                               (displayln (recorre-dfa dfa-rest linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-rest linea))))
                                                                    )
                               ]

  [(recorre-dfa dfa-divi linea) (begin
                               (displayln (recorre-dfa dfa-divi linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-divi linea))))
                                                                    )
                               ]
  [(recorre-dfa dfa-paiz linea) (begin
                                 (displayln (recorre-dfa dfa-paiz linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-paiz linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-pade linea) (begin
                                 (displayln (recorre-dfa dfa-pade linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-pade linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-pote linea) (begin
                                 (displayln (recorre-dfa dfa-pote linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-pote linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-sepa linea) (begin
                                (displayln (recorre-dfa dfa-sepa linea))
                                                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-sepa linea))))
                                                                    )
                                ]
  [else (displayln "Error, carácter no reconocido" )]
  )
" "
)
  )

;; Test case 1: Testing with a line containing a valid identifier
(tokens-en-linea-v2 "variable1") 
              (begin
                (displayln "iden")
                (displayln "sepa")
                (displayln "iden")
                (displayln "pade")
                " "
              )

