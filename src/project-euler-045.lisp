(in-package :cl-problem-solving)

(defun project-euler-045 ()
  "Find the next number after 40755 that is triangular, pentagonal, and hexagonal.
Since all hexagonal numbers are triangular (H_n = T_{2n-1}), iterate over hexagonal numbers
and check if pentagonal."
  (loop for n of-type fixnum from 144
        for h of-type fixnum = (the fixnum (* n (the fixnum (- (the fixnum (* 2 n)) 1))))
        when (pe044--pentagonal-p h)
          do (return h)))

;;; end
