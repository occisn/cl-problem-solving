;;;; Project Euler 63.
;;;;
;;;; https://projecteuler.net/problem=63

(in-package :cl-problem-solving)

;;; Math: x^n has n digits iff 10^(n-1) <= x^n < 10^n, so x <= 9
;;; and n <= 1/(1-log10(x)).

(defun project-euler-063 ()
  "Count n-digit positive integers that are also nth powers."
  (let ((count 0))
    (declare (type fixnum count))
    (loop for x of-type fixnum from 1 to 9
          do (incf count (the fixnum (floor (/ 1.0d0 (- 1.0d0 (log x 10)))))))
    count))

;;; end
