#lang racket
(require racket/format)

(define (analize_regexp file)
  (with-input-from-file file
    (lambda ()
      (let loop ((lines (port->lines (current-input-port))) (result '()))
        (cond
          ((null? lines) (reverse result))
          (else
            (let* ((line (car lines))
                   (pair (string-split line ",")))
              (loop (cdr lines) (cons pair result)))))))))
              

(define (regexp_matcher exp-list linea)
  (if (not (string=? linea ""))
      (let loop ((list exp-list) (linea linea))
        (define regex (car (car list)))
        (cond
          [(null? list) (displayln "Error: no regular expressions found")]
          [(null? (car list)) (displayln "Error: no regular expressions matched")]
          [(regexp-match regex linea)
            (begin
              (displayln (regexp-match regex linea))
              (regexp_matcher exp-list (substring linea (string-length (car (regexp-match regex linea))))))
          ]
          [else (loop (cdr list) linea)]
        )
      )
    (displayln "")
  )
)


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

(regexp_matcher (analize_regexp "regexp.txt") "var = 1")