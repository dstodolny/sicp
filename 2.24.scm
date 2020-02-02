(list 1 (list 2 (list 3 4)))
;; (1 (2 (3 4)))
;;
;;   +---+---+  +---+---+
;;   | * | *-+->| * | / |
;;   +-+-+---+  +-+-+---+
;;     |          |
;;     V          V
;;   +---+      +---+---+  +---+---+
;;   | 1 |      | * | *-+->| * | / |
;;   +---+      +-+-+---+  +---+---+
;;                |          |
;;                V          V
;;              +---+      +---+---+  +---+---+
;;              | 2 |      | * | *-+->| * | / |
;;              +---+      +-+-+---+  +-+-+---+
;;                           |          |
;;                           V          V
;;                         +---+      +---+
;;                         | 3 |      | 4 |
;;                         +---+      +---+
;;
;; (1 (2 (3 4)))
;;     /\
;;    /  \
;;   1  (2 (3 4))
;;        /\
;;       /  \
;;      2  (3 4)
;;          /\
;;         /  \
;;        3   (4)
;;             |
;;             4
