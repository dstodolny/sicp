(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch p m)
    (if (eq? p password)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request:
                 MAKE-ACCOUNT" m)))
        (lambda (x) "Incorrect password")))
  dispatch)

(define acc
  (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 140)
((acc 'some-other-password 'deposit) 50)