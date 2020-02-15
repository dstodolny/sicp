(define (make-leaf symbol weight)
o  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left) (weight right))))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set)))
         (cons x set))
        (else
         (cons (car set)
               (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set
         (make-leaf (car pair)
                    (cadr pair))
         (make-leaf-set (cdr pairs))))))

(define (successive-merge leaf-set)
  (if (eq? (length leaf-set) 1)
      (car leaf-set)
      (successive-merge
       (adjoin-set
        (make-code-tree (car leaf-set)
                        (cadr leaf-set))
        (cddr leaf-set)))))

(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

(define pairs '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)))

(generate-huffman-tree pairs)
