(define (regexp_matcher exp-list line) 
  (if (not (string=? line ""))
      (let ((analize (car exp-list)))
        (displayln (car analize))
        (cond
          [(null? analize) (displayln "Error: no regular expressions matched")]
          [(regexp-match (car analize) line)
            (begin
              (displayln (regexp-match (car analize) line))
              (regexp_matcher (cdr exp-list) (substring line (string-length (car (regexp-match (car analize) line))))))
          ]
          [else (regexp_matcher (cdr exp-list) line)]
        )
      )
    (displayln "Error: input string is empty")
  )
)
