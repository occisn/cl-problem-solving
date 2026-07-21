;;;; Project Euler 58.
;;;;
;;;; https://projecteuler.net/problem=58

(in-package :cl-problem-solving)

;;; Walk the spiral diagonals (like PE028) but track the ratio of primes.

(defun project-euler-058 ()
  "Side length of the square spiral where the prime ratio on diagonals first falls below 10%."
  (let ((nb-total 1)
        (nb-primes 0)
        (current 1))
    (declare (type fixnum nb-total nb-primes current))
    (loop for n of-type fixnum from 3 by 2
          for step of-type fixnum = (the fixnum (- n 1))
          do (loop repeat 4
                   do (incf current step)
                      (incf nb-total)
                      (when (pe037--primep current) (incf nb-primes)))
          until (< (the fixnum (* 10 nb-primes)) nb-total)
          finally (return n))))

;;; end
