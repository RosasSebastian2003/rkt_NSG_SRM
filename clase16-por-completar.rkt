#lang racket

(define (tokens-en-linea linea)
 (if (not (string=? linea "")) 
(cond
  [(regexp-match "^[A-Za-z](?>[A-Za-z]|[0-9]|_)*" linea) (begin
                                                           (displayln (car (regexp-match "^[A-Za-z](?>[A-Za-z]|[0-9]|_)*" linea)))
                                                           (tokens-en-linea (substring linea (string-length (car (regexp-match "^[A-Za-z](?>[A-Za-z]|[0-9]|_)*" linea)))))
                                                           )
                                                           ]
  [(regexp-match "^-?(?>[0-9]*\\.[0-9]+)(?>e[+-]?[0-9]+)?" linea) (begin
                                                                    (displayln (car (regexp-match "^-?(?>[0-9]*\\.[0-9]+)(?>e[+-]?[0-9]+)?" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^-?(?>[0-9]*\\.[0-9]+)(?>e[+-]?[0-9]+)?" linea)))))
                                                                    )
                                                                    ]
  [(regexp-match "^[0-9]+[0-9]*" linea) (begin
                                          (displayln (car (regexp-match  "^[0-9]+[0-9]*" linea)))
                                          (tokens-en-linea (substring linea (string-length (car (regexp-match "^[0-9]+[0-9]*" linea)))))
                                                                    )
                                          ]
  [(regexp-match "^//.*" linea) (begin
                                  (displayln (car (regexp-match "^//.*" linea)))
                                  (tokens-en-linea (substring linea (string-length (car (regexp-match "^//.*" linea)))))
                                                                    )
                                  ]
  [(regexp-match "^\\*" linea) (begin
                                 (displayln (car (regexp-match "^\\*" linea)))
                          (tokens-en-linea (substring linea (string-length (car (regexp-match "^\\*" linea)))))
                                                                    )
                                 ]
  [(regexp-match "^=" linea) (begin
                               (displayln (car (regexp-match "^=" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^=" linea)))))
                                                                    )
                               ]
  [(regexp-match "^\\+" linea) (begin
                                 (displayln (car (regexp-match  "^\\+" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^\\+" linea)))))
                                                                    )
                                 ]
  [(regexp-match "^-" linea) (begin
                               (displayln (car (regexp-match "^-" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^-" linea)))))
                                                                    )
                               ]

  [(regexp-match "^/" linea) (begin
                               (displayln (car (regexp-match "^/" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^/" linea)))))
                                                                    )
                               ]
  [(regexp-match "^\\(" linea) (begin
                                 (displayln (car (regexp-match "^\\(" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^\\(" linea)))))
                                                                    )
                                 ]
  [(regexp-match "^\\)" linea) (begin
                                 (displayln (car (regexp-match  "^\\)" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^\\)" linea)))))
                                                                    )
                                 ]
  [(regexp-match "^\\^" linea) (begin
                                 (displayln (car (regexp-match  "^\\^" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^\\^" linea)))))
                                                                    )
                                 ]
  [(regexp-match "^ +" linea) (begin
                                (displayln (car (regexp-match "^ +" linea)))
                                                                    (tokens-en-linea (substring linea (string-length (car (regexp-match "^ +" linea)))))
                                                                    )
                                ]
  [else (displayln "Error, carácter no reconocido" )]
  )
" "
)
  )