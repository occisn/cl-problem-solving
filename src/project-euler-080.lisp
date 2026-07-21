;;;; Project Euler 80.
;;;;
;;;; https://projecteuler.net/problem=80

(in-package :cl-problem-solving)

;;; Use isqrt on n * 10^(2*digits) to get digits of sqrt(n) as a bignum.

(defun project-euler-080 (&optional (n-max 100) (nb-digits 100))
  "Sum of first nb-digits decimal digits of sqrt(n) for all non-perfect-square n <= n-max."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (declare (type fixnum n-max nb-digits))
  (let ((sum 0)
        (multiplier (expt 10 (* 2 (- nb-digits 1)))))
    (declare (type fixnum sum) (type integer multiplier))
    (loop for n of-type fixnum from 1 to n-max
          for isqrt-n of-type fixnum = (isqrt n)
          when (/= n (* isqrt-n isqrt-n))
            do (let ((big-sqrt (isqrt (* n multiplier))))
                 (declare (type integer big-sqrt))
                 ;; Sum all digits of big-sqrt (which has nb-digits digits)
                 (loop while (> big-sqrt 0)
                       do (incf sum (the fixnum (mod big-sqrt 10)))
                          (setf big-sqrt (floor big-sqrt 10)))))
    sum))

;;; end
