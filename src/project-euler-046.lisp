;;;; Project Euler 46.
;;;;
;;;; https://projecteuler.net/problem=46

(in-package :cl-problem-solving)

(defun project-euler-046 ()
  "Smallest odd composite that cannot be written as prime + 2*k^2."
  (labels ((satisfies-conjecture-p (n)
             (declare (type fixnum n))
             (loop for k of-type fixnum from 1
                   for twice-k-sq of-type fixnum = (the fixnum (* 2 (the fixnum (* k k))))
                   while (< twice-k-sq n)
                   thereis (pe037--primep (the fixnum (- n twice-k-sq))))))
    (loop for n of-type fixnum from 9 by 2
          when (and (not (pe037--primep n))
                    (not (satisfies-conjecture-p n)))
            do (return n))))

;;; end
