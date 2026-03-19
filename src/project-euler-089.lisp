(in-package :cl-problem-solving)

(defun pe089--roman->integer (s)
  "Convert Roman numeral string to integer."
  (declare (type simple-string s))
  (let ((values '((#\M . 1000) (#\D . 500) (#\C . 100) (#\L . 50) (#\X . 10) (#\V . 5) (#\I . 1))))
    (loop for i of-type fixnum from 0 below (length s)
          for curr of-type fixnum = (the fixnum (cdr (assoc (char s i) values)))
          for next of-type fixnum = (if (< i (the fixnum (- (length s) 1)))
                                        (the fixnum (cdr (assoc (char s (the fixnum (+ i 1))) values)))
                                        0)
          if (< curr next) sum (the fixnum (- curr)) into total of-type fixnum
          else sum curr into total of-type fixnum
          finally (return total))))

(defun pe089--integer->roman (n)
  "Convert integer to minimal Roman numeral string."
  (declare (type fixnum n))
  (let ((result (make-array 0 :element-type 'character :fill-pointer 0 :adjustable t))
        (table '((1000 . "M") (900 . "CM") (500 . "D") (400 . "CD")
                 (100 . "C") (90 . "XC") (50 . "L") (40 . "XL")
                 (10 . "X") (9 . "IX") (5 . "V") (4 . "IV") (1 . "I"))))
    (dolist (entry table)
      (loop while (>= n (car entry))
            do (loop for c across (the simple-string (cdr entry)) do (vector-push-extend c result))
               (decf n (the fixnum (car entry)))))
    (coerce result 'simple-string)))

(defun project-euler-089 ()
  "Characters saved by writing Roman numerals in minimal form."
  (let ((input-file (merge-pathnames "project-euler-input-files/p089_roman.txt"
                                     (asdf:system-source-directory "cl-problem-solving")))
        (sum 0))
    (declare (type fixnum sum))
    (with-open-file (stream input-file)
      (loop for raw-line = (read-line stream nil)
            while raw-line
            for line of-type simple-string = raw-line
            do (incf sum (the fixnum (- (length line)
                                        (length (pe089--integer->roman (pe089--roman->integer line))))))))
    sum))

;;; end
