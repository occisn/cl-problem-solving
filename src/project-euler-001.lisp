;;;; Project Euler 1.
;;;;
;;;; https://projecteuler.net/problem=1

(in-package :cl-problem-solving)

(defun project-euler-001--not-optimized (&optional (n 1000))
  "Solve Project Euler 1."
  (declare (sb-ext:muffle-conditions sb-ext:compiler-note))
  (loop for i from 1 below n
        when (or (= 0 (mod i 3)) (= 0 (mod i 5)))
          sum i))

(defun project-euler-001 (&optional (n 1000))
  "Solve Project Euler 1."
  (declare (type fixnum n))
  (let ((sum 0))
    (declare (type fixnum sum))
    (loop for i of-type fixnum from 1 below n
          when (or (= 0 (mod i 3)) (= 0 (mod i 5)))
            do (incf sum i))
    sum))

;;; end
