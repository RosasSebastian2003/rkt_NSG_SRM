#lang racket
;;Anatomia de la tabla de estados
;;;Cada lista representa un estado
;;;Cada indice de la cada lista de la tabla de estados representa un grupo de caracteres o un solo caracter
;;;Cada indice de la lista contiene el estado al que se transiciona al leer el caracter correspondiente
;;:El estado -1 corresponde al estado trampa

;;; (define dfa- 
;;; (list 
;;; (list 
;;; (list 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
;;; (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
;;; (list 1, 1, 2, ..., n) ;Estado ...
;;; )
;;; (list 1) <- Aqui van los estados finales
;;; )
;;; )

;;Tabla de estados - Multiplicación
(define dfa-mult
(list 
(list 
(list 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

 
 ;;Tabla de estados - Identificador 
(define dfa-iden
(list 
(list
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1 1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 1 1 -1 1 1 1 1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)
 
;;Tabla de estados - asignacion
(define dfa-asig
(list 
(list
(list -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

;;Tabla de estados - Suma
(define dfa-suma
(list 
(list 
(list -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

;;Tabla de estados - Resta
(define dfa-rest
(list 
(list 
(list -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

;;Tabla de estados - Division
(define dfa-divi
(list 
(list 
(list -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)


;;Tabla de estados - Potencia
(define dfa-pote
(list 
(list 
(list -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

;;Tabla de estados - parentesis derecho 
(define dfa-pade
(list 
(list 
(list -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

;;Tabla de estados - parentesis izquierdo
(define dfa-paiz
(list 
(list 
(list -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)



(define dfa-real
(list
(list
(list -1 -1 -1 1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 3 -1) ; Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 3 -1) ; Estado 1
(list -1 -1 -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 3 -1) ; Estado 2
(list -1 -1 -1 -1 -1 -1 -1 -1 4 -1 -1 -1 -1 -1 -1 -1 -1) ; Estado 3
(list -1 -1 -1 -1 -1 -1 -1 -1 4 -1 -1 -1 -1 5 -1 -1 -1) ; Estado 4
(list -1 -1 6 6 -1 -1 -1 -1 7 -1 -1 -1 -1 -1 -1 -1 -1) ; Estado 5
(list -1 -1 -1 -1 -1 -1 -1 -1 7 -1 -1 -1 -1 -1 -1 -1 -1) ; Estado 6
(list -1 -1 -1 -1 -1 -1 -1 -1 7 -1 -1 -1 -1 -1 -1 -1 -1) ; Estado 7
)
(list 3 4 7) ;Estados finales 3, 4 y 7
)   
)

;;Tabla de estados - enteros
(define dfa-ente
(list 
(list 
(list -1 -1 -1 1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 -1 -1) 
(list -1 -1 -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 -1 -1) 
(list -1 -1 -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 -1 -1) 
)
(list 2) 
)
)

;;Tabla de estados - comentarios **EL estado 1 en el doc no permite que se reconozca el resto de la linea
(define dfa-come
(list 
(list 
(list -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
(list -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ; Estado 0: Inicio de comentario
(list 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2) ; Estado 1: Contenido del comentario (cualquier carácter es válido)
)
(list 2) ;Estado final 2
)
)

;;Tabla de estados - Separaciones
(define dfa-sepa
(list 
(list 
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1) ;Estado 0
(list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) ;Estado 1
)
(list 1) ;Estado final 1
)
)

;;;Se determina el grupo al que pertenece el caracter, cada numero representa un indice, osea un caracter
(define (determina-grupo linea)
(cond
  [(equal? (string-ref linea 0) #\*) 0] ;*
  [(equal? (string-ref linea 0) #\=) 1] ;=
  [(equal? (string-ref linea 0) #\+) 2] ;+
  [(equal? (string-ref linea 0) #\-) 3] ;-
  [(equal? (string-ref linea 0) #\/) 4] ;/
  [(equal? (string-ref linea 0) #\^) 5] ;^
  [(equal? (string-ref linea 0) #\() 6] ;(
  [(equal? (string-ref linea 0) #\)) 7] ;)
  [(and (>= (char->integer (string-ref linea 0)) 48) (<= (char->integer (string-ref linea 0)) 57)) 8] ;numeros 0-9
  [(equal? (string-ref linea 0) #\_) 9] ;_
  [(equal? (string-ref linea 0) #\ ) 10] ;espacio
  [(and (>= (char->integer (string-ref linea 0)) 65) (<= (char->integer (string-ref linea 0)) 90)) 11] ;letras mayusculas
  [(and (>= (char->integer (string-ref linea 0)) 97) (<= (char->integer (string-ref linea 0)) 100)) 12] ;letras minusculas a-d
  [(equal? (string-ref linea 0) #\e) 13] ;e
  [(and (>= (char->integer (string-ref linea 0)) 102) (<= (char->integer (string-ref linea 0)) 122)) 14] ;letras minusculas f-z
  [(equal? (string-ref linea 0) #\.) 15] ;.
  [else 16] ;Resto de los caracteres
  )
)



;;;Dividimos la entrada en tokens
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







;;;Se le asigna un grupo a cada token
(define (tokens-en-linea-v2 linea)
 (if (not (string=? linea "")) 
(cond
  [(recorre-dfa dfa-iden linea) (begin
                                    (display "Variable: ")
                                    (displayln (recorre-dfa dfa-iden linea))
                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-iden linea))))
                                                           )
                                                           ]
  [(recorre-dfa dfa-real linea) (begin
                                    (display "Real: ")
                                    (displayln (recorre-dfa dfa-real linea))
                                    (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-real linea))))
                                                                    )
                                                                    ]
  [(recorre-dfa dfa-ente linea) (begin
                                   (display "Entero: ")
                                   (displayln (recorre-dfa dfa-ente linea))
                                   (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-ente linea))))
                                                                    )
                                          ]
  [(recorre-dfa dfa-come linea) (begin
                                  (display "Comentario: ")
                                  (displayln (recorre-dfa dfa-come linea))
                                  (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-come linea))))
                                                                    )
                                  ]
  [(recorre-dfa dfa-mult linea) (begin
                                 (display "Multiplicación: ")
                                 (displayln (recorre-dfa dfa-mult linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-mult linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-asig linea) (begin
                                 (display "Asignación: ")
                                 (displayln (recorre-dfa dfa-asig linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-asig linea))))
                                                                    )
                               ]
  [(recorre-dfa dfa-suma linea) (begin
                                 (display "Suma: ")
                                 (displayln (recorre-dfa dfa-suma linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-suma linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-rest linea) (begin
                                 (display "Resta: ")
                                 (displayln (recorre-dfa dfa-rest linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-rest linea))))
                                                                    )
                                 ]

  [(recorre-dfa dfa-divi linea) (begin
                                 (display "Division: ")
                                 (displayln (recorre-dfa dfa-divi linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-divi linea))))
                                                                    )
                               ]
  [(recorre-dfa dfa-paiz linea) (begin
                                 (display "Parentesis izquierdo: ")
                                 (displayln (recorre-dfa dfa-paiz linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-paiz linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-pade linea) (begin
                                 (display "Parentesis derecho: ")
                                 (displayln (recorre-dfa dfa-pade linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-pade linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-pote linea) (begin
                                 (display "Potencia: ")
                                 (displayln (recorre-dfa dfa-pote linea))
                                 (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-pote linea))))
                                                                    )
                                 ]
  [(recorre-dfa dfa-sepa linea) (begin
                                (display "Separación: ")
                                (displayln (recorre-dfa dfa-sepa linea))
                                (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-sepa linea))))
                                                                    )
                                ]
  [else (displayln "Error, carácter no reconocido" )]
  )
" "
)
)

;;;Lectura de un archivo de texto
(define (read-file filename)
  (let ((port (open-input-file filename))) ;Creamos un objeto port que representa el archivo
    (let loop ((line (read-line port))) ;Leemos el archivo linea por linea
      (cond
        [(eof-object? line) (close-input-port port)] ;Si llegamos al final del archivo, lo cerramos
        [else (begin
                (display "Linea: ")
                (displayln line )
                (displayln "Tokens: \n")
                (tokens-en-linea-v2 line)
                (displayln "------------------------------------------ \n")
                (loop (read-line port))
                )]
        )
      )
    )
  )

  (read-file "test.txt")