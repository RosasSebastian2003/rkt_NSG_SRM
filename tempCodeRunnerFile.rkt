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
                   (pair (string-split line ","))
                   (color (format "#~x" (random (expt 16 6)))))
              (loop (cdr lines) (cons (cons (car pair) color) result)))))))))


(define (regexp_matcher exp-list linea)
  (if (not (string=? linea ""))
      (let loop ((list exp-list) (linea linea))
        (define regex (car (car list)))
        (define color (cdr (car list)))
        (displayln linea)
        (displayln regex)
        (cond
          [(null? list) (displayln "Error: no regular expressions found")]
          [(null? (car list)) (displayln "Error: no regular expressions matched")]
          [(regexp-match regex linea)
            (begin
              (displayln (format "<span style=\"color: ~a;\">~a</span>" color (car (regexp-match regex linea))))
              (regexp_matcher exp-list (substring linea (string-length (car (regexp-match regex linea))))))
          ]
          [else (loop (cdr list) linea)]
        )
      )
    (displayln "")
  )
)


(regexp_matcher (analize_regexp "regexp.txt") "var = 1")

(define (generate_html_file input-file output-file exp-list)
  (define output-str "")
  (with-input-from-file input-file
    (lambda ()
      (let loop ((lines (port->lines (current-input-port))))
        (cond
          ((null? lines) output-str)
          (else
            (let ((line (car lines)))
              (set! output-str (string-append output-str "<p>"))
              (regexp_matcher exp-list line)
              (set! output-str (string-append output-str "</p>\n"))
              (loop (cdr lines))))))))
  (with-output-to-file output-file
    (lambda ()
      (displayln "<html>")
      (displayln "<head>")
      (displayln "<title>Regexp Matcher Output</title>")
      (displayln "</head>")
      (displayln "<body>")
      (display output-str)
      (displayln "</body>")
      (displayln "</html>"))))


(generate_html_file "test.txt" "output.html" (analize_regexp "regexp.txt"))