#lang racket

(provide resaltador)

(define (write-html output-file output-str)
  (with-output-to-file output-file
    #:mode 'text 
    #:exists 'append
    (lambda ()
      (displayln output-str))))


(define (analize_regexp file)
  (with-input-from-file file
    (lambda ()
      (let loop ((lines (port->lines (current-input-port))) (result '()))
        (cond
          ((null? lines) (reverse result))
          (else
            (let* ((line (car lines))
                   (pair (string-split line ","))
                   
                   
                   (hue (random 270 480))
                   ;; Convert the hue value to RGB components
                   (red (round (* 255 (if (< hue 360) 1 (- (* hue 360/60) 1)))))
                   (green (round (* 255 (if (< hue 120) (* hue 120/60) (- (* hue 240/60) 2)))))
                   (blue (round (* 255 (if (< hue 240) 0 (if (< hue 360) (* (- hue 240) 120/60) (- (* hue 360/60) 5)))))))
                (let ((color (format "#~x~x~x" red green blue)))
                  (if (or (< hue 20) (> hue 60))
                      (loop (cdr lines) (cons (cons (car pair) (substring color 0 7)) result))
                      (loop (cdr lines) result))))))))))

(define (regexp_matcher exp-list linea htmlFile)
  (if (not (string=? linea ""))
      (let loop ((list exp-list) (linea linea))
        (define regex (car (car list)))
        (define color (cdr (car list)))
        
        (cond
          [(null? list) (displayln "")]
          [(regexp-match regex linea)
            (begin
              (write-html htmlFile (format "<span style=\"color: ~a;\">~a</span>" color (car (regexp-match regex linea))))
              (regexp_matcher exp-list (substring linea (string-length (car (regexp-match regex linea)))) htmlFile))
          ]
          [(null? (cdr list)) (write-html htmlFile (format "<span style=\"color: #FF0000;\">:ERROR, no se reconoce la expresion ~a</span>" linea))]
          [else (loop (cdr list) linea)]
        )
      )
    (displayln "")
  )
)


(define (resaltador regexp-file input-file output-file)
  (define exp-list (analize_regexp regexp-file))
  (define (write-html-body)
    (write-html output-file "<html><body>")
    (write-html output-file "<h1><center>Actividad Integradora 3.4 Resaltador de sintaxis</center></h1>")
    (write-html output-file "<h2><center>Sebastián Rosas Maciel - A01233989</center></h2>")
    (with-input-from-file input-file
      (lambda ()
        (let loop ((linea (read-line)))
          (cond
            [(eof-object? linea) (void)]
            [else
              (write-html output-file "<div style=\"display: block;\">")
              (regexp_matcher exp-list linea output-file)
              (write-html output-file "</div>")
              (write-html output-file " ")
              (loop (read-line))]
          )
        )
      )
    )
    (write-html output-file "</body></html>")
  )
  (if (file-exists? output-file)
      (write-html-body)
      (begin
        (write-html output-file "")
        (write-html-body)
      )
  )
)

