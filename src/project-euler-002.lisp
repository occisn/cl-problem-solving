;;;; Project Euler 2.
;;;;
;;;; https://projecteuler.net/problem=2

(in-package :cl-problem-solving)

(defun project-euler-002--not-optimized (&optional (n 4000000))
  "Solves Project Euler 2."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop
        with sum = 0
        for f1 = 0 then f2
        and f2 = 1 then (+ f1 f2)
        while (<= f2 n)
        when (evenp f2) do (incf sum f2)
        finally (return sum)
        ))

(defun project-euler-002 (&optional (n 4000000))
  "Solves Project Euler 2."
  (declare (type fixnum n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop 
          for f1 of-type fixnum = 0 then f2
          and f2 of-type fixnum = 1 then (+ f1 f2)
          while (<= f2 n)
          when (evenp f2) do (incf sum f2))
    sum))

;;; end
